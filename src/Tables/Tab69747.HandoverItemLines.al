table 69747 "Hand over Item Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Exit Header No"; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = ' ,Exit Voucher,Hand Over Voucher,Final Dues Voucher';
            OptionMembers = " ","Exit Voucher","Hand Over Voucher","Final Dues Voucher";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Temp Id"; Code[30])
        {
        }
        field(5; Type; Enum "Exit Sections")
        {
            // OptionCaption = 'Asset,Item,File,Resource,Other';
            // OptionMembers = Asset,Item,File,Resource,Other;
        }
        field(6; No; Text[250])
        {
            Caption = 'Item';
            TableRelation = "Clearance Form Setup".Description where(Section = field(Type));
            // else
            // if (Type = const(Resource)) Resource where(Blocked = const(false))
            // else
            // if (Type = const(File)) Employee
            // else
            // if (Type = const(Asset)) "Fixed Asset"
            // else
            // if (Type = const(Item)) Item;
        }
        field(7; Description; Text[50])
        {
            Caption = 'Result';
        }
        field(8; "Return Date"; Date)
        {
        }
        field(9; "Received By"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
        }
        field(10; "Clearing Employee"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
        }
        field(11; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(69000; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Directorate");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Directorate Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(69001; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code, "Primary Department");
                if ResponsibilityCenter.Find('-') then begin
                    "Primary Department Name" := ResponsibilityCenter.Name;
                    //"Responsible Employee":=ResponsibilityCenter."Current Head";
                end;
            end;
        }
        field(69002; "Primary Directorate Name"; Text[250])
        {
        }
        field(69003; "Primary Department Name"; Text[250])
        {
        }
        field(69004; "Received Date"; Date)
        {
        }
        field(69005; "Recievied Time"; Date)
        {
        }
        field(69006; Receiveved; Boolean)
        {
        }

    }

    keys
    {
        key(Key1; "Exit Header No", "Document Type", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

