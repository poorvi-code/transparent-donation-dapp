// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Donation {

    struct Campaign {
        address owner;
        string title;
        string description;
        uint256 goal;
        uint256 deadline;
        uint256 amountRaised;
        bool fundsReleased;
    }

    mapping(uint256 => Campaign) public campaigns;
    uint256 public campaignCount;
    mapping(uint256 => mapping(address => uint256)) public donations;

    event CampaignCreated(uint256 campaignId, address owner, string title, uint256 goal);
    event DonationReceived(uint256 campaignId, address donor, uint256 amount);
    event FundsReleased(uint256 campaignId, address owner, uint256 amount);

    function createCampaign(
        string memory _title,
        string memory _description,
        uint256 _goal,
        uint256 _durationInDays
    ) public {
        require(_goal > 0, "Goal must be greater than 0");
        require(_durationInDays > 0, "Duration must be at least 1 day");

        uint256 campaignId = campaignCount;

        campaigns[campaignId] = Campaign({
            owner: msg.sender,
            title: _title,
            description: _description,
            goal: _goal,
            deadline: block.timestamp + (_durationInDays * 1 days),
            amountRaised: 0,
            fundsReleased: false
        });

        campaignCount++;

        emit CampaignCreated(campaignId, msg.sender, _title, _goal);
    }

    function donate(uint256 _campaignId) public payable {
        Campaign storage campaign = campaigns[_campaignId];

        require(block.timestamp < campaign.deadline, "Campaign has ended");
        require(msg.value > 0, "Donation must be greater than 0");

        campaign.amountRaised += msg.value;
        donations[_campaignId][msg.sender] += msg.value;

        emit DonationReceived(_campaignId, msg.sender, msg.value);
    }

    function releaseFunds(uint256 _campaignId) public {
        Campaign storage campaign = campaigns[_campaignId];

        require(msg.sender == campaign.owner, "Only campaign owner can release funds");
        require(campaign.amountRaised >= campaign.goal, "Goal not reached yet");
        require(!campaign.fundsReleased, "Funds already released");

        campaign.fundsReleased = true;

        (bool success, ) = payable(campaign.owner).call{value: campaign.amountRaised}("");
        require(success, "Transfer failed");

        emit FundsReleased(_campaignId, campaign.owner, campaign.amountRaised);
    }

    function getCampaign(uint256 _campaignId) public view returns (
        address owner,
        string memory title,
        string memory description,
        uint256 goal,
        uint256 deadline,
        uint256 amountRaised,
        bool fundsReleased
    ) {
        Campaign storage campaign = campaigns[_campaignId];
        return (
            campaign.owner,
            campaign.title,
            campaign.description,
            campaign.goal,
            campaign.deadline,
            campaign.amountRaised,
            campaign.fundsReleased
        );
    }

    function getAllCampaigns() public view returns (Campaign[] memory) {
        Campaign[] memory allCampaigns = new Campaign[](campaignCount);
        for (uint256 i = 0; i < campaignCount; i++) {
            allCampaigns[i] = campaigns[i];
        }
        return allCampaigns;
    }
}