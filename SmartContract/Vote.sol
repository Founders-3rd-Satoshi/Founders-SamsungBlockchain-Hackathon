pragma solidity ^0.5.6;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public votedOrNot;
    // Read/write candidates
    mapping(uint => Candidate) public candidates;
    // Store Candidates Count
    uint public candidatesCount;
    //mapping who voted to whom
    mapping(address => uint) public whoVotedToWhom;
    //total vote Count
    uint public totalVoteCount;

    function candidateList () public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
        //can add more
    }

    function addCandidate (string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!votedOrNot[msg.sender]);
        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        // record that voter has voted
        votedOrNot[msg.sender] = true; //true == voted
        whoVotedToWhom[msg.sender] = _candidateId;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;
        totalVoteCount++;
    }

    //show results
    function getMyVoteResult() public view returns(uint seeMyVoteResult){
      //voted?
      require(votedOrNot[msg.sender] == true);
      //if then, voted to whom?
      return whoVotedToWhom[msg.sender];
   }
   function getTotalVoteCount() public view returns(uint seetotalVoteCount){
       //total votes
       return totalVoteCount;
   }
   function getVoteCountPerCandidate(uint _candidateId) public view returns(uint seeVoteCount){
       //candidate id --> vote count
        return candidates[_candidateId].voteCount;
   }
}