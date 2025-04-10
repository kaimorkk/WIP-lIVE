table 69744 "Exit Plan Lines"
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
        field(4; "Primary Directorate"; Code[50])
        {
            caption = 'Implementing Unit';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate | "Department/Center" | "Division/Section" | "Court Stations" | Office));
            trigger OnValidate()
            var
                RC: Record "Responsibility Center";
            begin
                RC.Reset();
                RC.SetRange(code, "Primary Directorate");
                if RC.FindSet() then
                    Validate("Responsible Employee", RC."Current Head");
                "Primary Directorate Name" := RC.Name;
            end;
        }
        field(80012; "Responsible Employee Name"; Text[100])
        {
            editable = false;
        }
        field(5; "Primary Directorate Name"; Text[250])
        {

            caption = 'Implementing Unit Name';
        }
        field(6; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(7; "Primary Department Name"; Text[250])
        {
        }
        field(8; "Responsible Employee"; Code[30])
        {
            TableRelation = Employee."No.";
            trigger OnValidate()
            var
                Emp: Record Employee;
            begin
                if Emp.Get("Responsible Employee") then
                    "Responsible Employee Name" := Emp.FullName();
            end;
        }
        field(9; "Planned Date"; Date)
        {
        }
        field(10; "Actual Date"; Date)
        {
        }
        field(11; Status; Option)
        {
            OptionCaption = 'Open,Cleared';
            OptionMembers = Open,Cleared;
        }
        field(12; "cleared By"; Text[255])
        {
        }
        field(13; "Hand Doc Over No"; Code[30])
        {
        }
        field(14; "Final Due Doc No"; Code[30])
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
}

