table 50044 "Training History"
{
    Caption = 'Training History';
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
        field(3; Training; Text[100])
        {
            Caption = 'Training';
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; Funding; Option)
        {
            Caption = 'Funding';
            OptionCaption = 'Self,Judiciary,Partners,Government';
            OptionMembers = Self,Employer,Partners,Government;
        }
        field(7; Institution; Text[150])
        {
        }
        field(8; "Institution No."; Code[20])
        {
            TableRelation = Vendor;
            trigger OnValidate()
            var
                Vendor: Record Vendor;

            begin
                Vendor.setRange("No.", "Institution No.");
                Vendor.FindFirst();
                Institution := Vendor.Name;
            end;
        }
        field(9; "Employee No"; Code[20])
        {
            TableRelation = Employee;
        }
    }




    keys
    {
        key(PK; "Training No", "Line No", "Employee No")
        {
            Clustered = true;
        }
    }

}
