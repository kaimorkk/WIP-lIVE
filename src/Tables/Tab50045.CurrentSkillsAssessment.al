table 50045 "Current Skills Assessment"
{
    Caption = 'Current Skills Assessment';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Training No"; Code[20])
        {
            Caption = 'Training No';
        }
        field(2; "Line No"; Integer)
        {
            Caption = 'Line No';
            AutoIncrement = true;
        }
        field(3; "Major Tasks"; Text[200])
        {
            Caption = 'Major Tasks';
        }
        field(4; "Training Required"; Boolean)
        {
            Caption = 'Training Required';
        }
        field(5; "Existing Training Needs"; Text[250])
        {
            Caption = 'Existing Training Needs';
        }
        field(6; "Training Mode"; Option)
        {
            Caption = 'Training Mode';
            OptionCaption = 'On Job,Full Time,Part Time,Virtual,Hybrid';
            OptionMembers = "On Job",External,"Part Time",Virtual,Hybrid;
        }
        field(7; "Start Date"; Date)
        {

        }
        field(8; "Institution No."; Code[20])
        {
            TableRelation = Vendor;
            trigger OnValidate()
            var
                Vendor: Record Vendor;
            begin
                Vendor.get("Institution No.");
                Institution := Vendor.Name;
            end;
        }
        field(9; Institution; Text[100])
        {
        }
    }
    keys
    {
        key(PK; "Training No", "Line No")
        {
            Clustered = true;
        }
    }
}
