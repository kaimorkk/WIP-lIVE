
table 69731 "Benefit Package"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Package ID"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Primary Objective"; Text[400])
        {
        }
        field(4; "Benefit Program ID"; Code[30])
        {
            TableRelation = "Benefit Program";
        }
        field(5; "Benefit Category"; Option)
        {
            OptionCaption = 'Other Incentives,Social Security,Health Care,Retirement Plans,Insurance Plans,Mortgage,Other Staff Loans,Staff Housing,Staff Leave,Learning and Skill Development,Recreational';
            OptionMembers = "Other Incentives","Social Security","Health Care","Retirement Plans","Insurance Plans",Mortgage,"Other Staff Loans","Staff Housing","Staff Leave","Learning and Skill Development",Recreational;
        }
        field(6; "Beneficiary Type"; Option)
        {
            OptionCaption = 'Employee Only,Employee+Spouse,Employee+Spouse+Other Dependents';
            OptionMembers = "Employee Only","Employee+Spouse","Employee+Spouse+Other Dependents";
        }
        field(7; "Statutory Requirement"; Boolean)
        {
        }
        field(8; "Applicable to all Staff"; Boolean)
        {
        }
        field(9; "Applicable to Retired Staff"; Boolean)
        {
        }
        field(10; "Enrollment Type"; Option)
        {
            OptionCaption = ' ,Company Enrollment,Employee Application';
            OptionMembers = " ","Company Enrollment","Employee Application";
        }
        field(11; "Effective Date"; Date)
        {
        }
        field(12; "Company Policy ID"; Code[30])
        {
        }
        field(13; "Renewal Frequency"; Option)
        {
            OptionCaption = 'None,Month,Quarter,Half-Year,Annual';
            OptionMembers = "None",Month,Quarter,"Half-Year",Annual;
        }
        field(14; "No. of Renewals"; Integer)
        {
        }
        field(15; "Last Renewal Date"; Date)
        {
        }
        field(16; "Min Eligibe Age(Yrs)"; Integer)
        {
        }
        field(17; "Max Eligibe Age(Yrs)"; Integer)
        {
        }
        field(18; "Min Length of Service(Yrs)"; Integer)
        {
        }
        field(19; "Max Waiting Period for Enroll"; DateFormula)
        {
        }
        field(20; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Package ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

