
table 70150 "IFS Bid Schedule"
{
    Caption = 'IFS Bid Schedule';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Document No"; Code[30])
        {
            TableRelation = "Request For Information".Code;
        }
        field(3; "Activity Category"; Option)
        {
            Description = 'Used to categorize key activities that are scheduled for a given IFP such as submission deadlines. NB: Internal activities are those that have to be undertaken by the Procuring entity and shall not appear on the E-Procurement Portal. External activities relate to the suppliers and shall appear on the Portal';
            OptionCaption = 'Internal/Procuring Entity,External/Vendor';
            OptionMembers = "Internal/Procuring Entity","External/Vendor";
        }
        field(4; Description; Text[250])
        {
        }
        field(5; "Start Date"; Date)
        {
        }
        field(6; "Start Time"; Time)
        {
        }
        field(7; "End Date"; Date)
        {
        }
        field(8; "End Time"; Time)
        {
        }
        field(9; "Activity Status"; Option)
        {
            OptionCaption = ',Planned,Ongoing,Completed';
            OptionMembers = ,Planned,Ongoing,Completed;
        }
        field(10; "Document Type"; Option)
        {
            OptionCaption = ',Invitation For Prequalification,EOI Invitation';
            OptionMembers = ,"Invitation For Prequalification","EOI Invitation";
        }
    }

    keys
    {
        key(Key1; "Document Type", "Entry No", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

