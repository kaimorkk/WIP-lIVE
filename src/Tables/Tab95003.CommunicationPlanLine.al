
table 95003 "Communication Plan Line"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional,Project';
            OptionMembers = " ",Corporate,Functional,Project;
        }
        field(2; "Document No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Category; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Meeting,Status Report';
            OptionMembers = " ",Meeting,"Status Report";
        }
        field(4; "Line No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; "Communication Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'If Category::Meeting, this field links to Project Meeting Type.Code field. If Category::Status Report, this field links to Status Report Type.Code  field. On validation of this field, the system auto-populates the description field';
        }
        field(6; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Frequency; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'This field displays the frequency of the project communication. When the Suggest Recurring Meeting Schedule batch job is run, the system can create a list of all planned meetings by validating the Frequency field and the Initial Meeting Date field.';
            OptionCaption = ' ,None,Once,Weekly,Monthly,Quarterly,Half-Yearly,Yearly';
            OptionMembers = " ","None",Once,Weekly,Monthly,Quarterly,"Half-Yearly",Yearly;
        }
        field(8; "Default Meeting Medium"; Option)
        {
            DataClassification = ToBeClassified;
            Description = 'This field is used to define the default medium (Such as Face to Face/Physical meetings or Online meetings) for specific meetings. When the Suggest Recurring Meeting Schedule batch job is run, the system will create the planned meetings with the default meeting medium. However, the user can amend each planned meeting accordingly.';
            OptionCaption = ' ,Face to Face,Online';
            OptionMembers = " ","Face to Face",Online;
        }
        field(9; "Primary Owner"; Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'This field is used to define the Role ID that is primary assigned the responsibility of managing a specififc communication type. It is linked to the Project Staff Role Code table (Filters applied such that Blocked::False).';
        }
        field(10; "First Meeting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "No. of Target Stakeholders"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'This field displays a count of all the stakeholders that are targeted for a specific communication type. This calcfield counts records from the Comm Plan Line Stakeholder table';
        }
        field(12; "No. of Planned Meetings"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'When the Suggest Recurring Meeting Schedule Action is run, the system will update the details of the Comm Plan Meeting Schedule table. This calcfield displays a count of all scheduled meetings of a specific meeting type, with the details being pulled from the Comm Plan Meeting Schedule table.';
        }
        field(13; "No. of Meetings Held"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'This field counts records from the Project Meeting Register table based on matching Communication Plan ID.';
        }
        field(14; "Default Report Medium"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Hard Copy,Email,Soft Copy File';
            OptionMembers = " ","Hard Copy",Email,"Soft Copy File";
        }
        field(15; "No. of Project Reports"; Integer)
        {
            DataClassification = ToBeClassified;
            Description = 'This field displays a count of the project reports that have been processed for a given reporting type. The calcfield counst records from the Project Reporting Header table';
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No", Category, "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

