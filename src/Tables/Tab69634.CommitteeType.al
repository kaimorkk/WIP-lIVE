
table 69634 "Committee Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Functional Classification"; Option)
        {
            OptionCaption = ',Core Mandate,Finance,Procurement,Human Resource,ICT,Legal,Risk & Audit,Other';
            OptionMembers = ,"Core Mandate",Finance,Procurement,"Human Resource",ICT,Legal,"Risk & Audit",Other;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Title of Appointing Officer"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(5; "Non-Staff Allowed"; Boolean)
        {
        }
        field(6; "Minimim No. of Members"; Integer)
        {
        }
        field(7; "No. of Appointments Made"; Integer)
        {
        }
        field(8; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

