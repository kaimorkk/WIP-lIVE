
table 80208 "Business Research"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = ' ,Employee Experience,Customer Experience,Post-Project Survey,Custom Survey';
            OptionMembers = " ","Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(3; "Document Date"; Date)
        {
        }
        field(4; Description; Text[50])
        {
        }
        field(5; "Business Research Template ID"; Code[50])
        {
        }
        field(6; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(7; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
        field(8; Published; Boolean)
        {
        }
        field(9; "Date Published"; Date)
        {
        }
        field(10; "Response Due Date"; Date)
        {
        }
        field(11; "Created By"; Code[30])
        {
        }
        field(12; "Creation Date"; Date)
        {
        }
        field(13; "Creation Time"; Time)
        {
        }
        field(14; "Approval Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(15; "No. of Responses"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

