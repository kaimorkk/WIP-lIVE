
table 70226 "Vendor Registration Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "IFP No."; Code[20])
        {
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                Vendors.Reset;
                Vendors.SetRange("No.", "Vendor No.");
                if Vendors.FindSet then
                    "Vendor Name" := Vendors.Name;
            end;
        }
        field(4; "Procurement Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(5; "Procurement Category Code"; Code[30])
        {
            TableRelation = "Procurement Category".Code;
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "Start Date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; Blocked; Boolean)
        {
        }
        field(10; "Date Blocked"; Date)
        {
        }
        field(11; "Document Type"; Option)
        {
            OptionCaption = 'IFP Response,EOI Response,IFR Response';
            OptionMembers = "IFP Response","EOI Response","IFR Response";
        }
        field(12; "Posting Date"; Date)
        {
        }
        field(13; "Document No."; Code[30])
        {
        }
        field(14; Region; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Region));
        }
        field(15; Constituency; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Constituency));
        }
        field(16; "Vendor Name"; Text[250])
        {
        }
        field(17; "Evaluation Decision"; Option)
        {
            Description = 'Final evaluation verdict by the Procurement function';
            OptionCaption = ',Pass,Fail';
            OptionMembers = ,Pass,Fail;
        }
        field(18; "Evaluation Score %"; Decimal)
        {
            Description = 'Any % score that may be assigned to each evaluation';
            MaxValue = 100;
            MinValue = 0;
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No.", "Procurement Category Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Vendor No.", "Vendor Name")
        {
        }
    }

    var
        Vendors: Record Vendor;
}

