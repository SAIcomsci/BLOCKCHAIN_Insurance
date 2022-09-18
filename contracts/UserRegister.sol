// SPDX-License-Identifier: MIT

pragma solidity ^0.8;

contract UserRegister {


    uint public _c_id =0;
    uint public _u_id =0;
    uint public t_id=0;
    //uint public _t_id=0;

    // structure for User
    struct User {
        uint Addhaarid;
        string name;
        string location;
        uint age;
        string gender;
        uint contact;
        address add;
        uint id;
    }
    struct Company{
        uint lice;
        string name;
        string blocation;
        address cadd;
        uint cid;
    }

    struct Policy {
        uint policy_id;
        string policy_name;
        uint premium_monthly;
        uint ploy_year;
        uint reimburse;
        string company_name;
        address company_add;
        uint i_cid;
    }
    struct Track_Insu{
        uint Adhr_tid;
        uint usr_id;
        uint ins_id;
        uint com_id;
        address uadd;
        address cadd;
        uint tid;
    }

    //mapping(uint=> Company) c1;
    mapping(address => Company) c1;
    mapping (address => User) u1;
    mapping(uint => Policy) p1;
    mapping (uint =>Track_Insu) t1;
    // Creating array of student structure
    User[] person;
    Company[] company;
    Policy[] policy;
    Track_Insu[] trackins;
    //mapping(uint => User) public studs;

    // Function to add User into the User structure
    function addUser(uint _aid,string memory _name, string memory _location, uint _age, string memory _gender, uint _contact, address _add ) public {
        _u_id=_u_id+1;
        UserRegister.User memory x = User(_aid,_name, _location, _age, _gender,_contact, _add,_u_id);
        person.push(x);
        u1[_add] = x;
    }

    // Function to check User who are already registered or not!!!!!

    function checkUser(address _add) view public returns(uint) {
        uint _find = 0;
        for (uint _i = 0; _i < person.length; _i++) {
            if (person[_i].add == _add) {
                _find = 1;
            }
        }
        for (uint _i = 0; _i < company.length; _i++) {
            if (company[_i].cadd == _add) {
                _find = 2;
            }
        }

        return (_find);
    }

     // Function to show User 

    function showUser(address _addr) public view returns(uint, string memory,string memory, uint,string memory,uint, uint ){
        return(u1[_addr].Addhaarid,u1[_addr].name,u1[_addr].location,u1[_addr].age,u1[_addr].gender,u1[_addr].contact,u1[_addr].id);
    }

    // Function to add company into the company structure

     function addcom(uint _li,string memory _cname, string memory _clocation, address _cadd) public {
        _c_id=_c_id+1;
        UserRegister.Company memory c = Company(_li,_cname, _clocation, _cadd,_c_id);
        company.push(c);
        c1[_cadd] = c;
    }


    function checkCompany(address _add) view public returns(uint) {
        uint _find = 0;
        for (uint _i = 0; _i < company.length; _i++) {
            if (company[_i].cadd == _add) {
                _find = 1;
            }
        }
        for (uint _i = 0; _i < person.length; _i++) {
            if (person[_i].add == _add) {
                _find = 2;
            }
        }

        return (_find);
    }


    // Function to show company

    function showcom(address _cadd) public view returns(uint, string memory,string memory,uint ){
        return(c1[_cadd].lice,c1[_cadd].name,c1[_cadd].blocation,c1[_cadd].cid);
    }



    // function to add policy

    function addPolicy(uint _pid,string memory _pname, uint _premium, uint _myear, uint _reimburse,  address _cadd ) public {
        _u_id=_u_id+1;
        UserRegister.Policy memory p = Policy(_pid,_pname, _premium,_myear, _reimburse,c1[_cadd].name, _cadd,c1[_cadd].cid);
        policy.push(p);
        p1[_pid] = p;
    }

    // Function to check Policys  are already registered or not!!!!!

    function checkPolicy(uint _pid) view public returns(uint) {
        uint _find = 0;
        for (uint _i = 0; _i < policy.length; _i++) {
            if (policy[_i].policy_id == _pid) {
                _find = 1;
            }
        }

        return (_find);
    }
     // Function to show Policys  that are already registered !!!!!

    function showIns(uint _id) public view returns(uint, string memory, uint, uint,uint ,string memory,address,uint){
        Policy memory pol= p1[_id];
        return(pol.policy_id, pol.policy_name, pol.premium_monthly, pol.ploy_year, pol.reimburse, pol.company_name, pol.company_add, pol.i_cid);
        //return(p1[_id].policy_id, p1[_id].policy_name, p1[_id].premium_monthly, p1[_id].ploy_year, p1[_id].reimburse, p1[_id].company_name, p1[_id].company_add, p1[_id].i_cid);
    }

    function getPolicySize() public view returns(uint) {
        uint _size;
        _size = policy.length;
        return (_size);
    }

    function getPolicyByIndex(uint _i) public view returns(uint, string memory, uint, uint,uint ,string memory,address) {
        return(policy[_i].policy_id, policy[_i].policy_name, policy[_i].premium_monthly, policy[_i].ploy_year, policy[_i].reimburse, policy[_i].company_name, policy[_i].company_add);
    }

    function BuyIns(uint insid,address  uadd)public payable {
        t_id=t_id+1;

        address sender = uadd;
        uint bal1 = sender.balance;
        address   payable receiver=payable(p1[insid].company_add );
    //uint bal2 = receiver.balance;

    //mapping(address => uint) public addressToBalance;

    //function send(address payable _receiver) public payable {
        //receiver = _receiver;
        uint value= p1[insid].premium_monthly ;
        if (bal1>=value){
            bal1 -= value;
        //bal2 += msg.value;
        receiver.transfer(value);
        //addressToBalance[sender] = bal1;
        //addressToBalance[receiver] = receiver.balance;
        }
        UserRegister.Track_Insu memory t = Track_Insu(u1[uadd].Addhaarid ,u1[uadd].id,insid,p1[insid].i_cid, p1[insid].company_add ,uadd,t_id);
        trackins.push(t);
        t1[t_id]=t;

    }
    //function Payment()
    //function showbuyins(_tid) public views returns()
  
}
