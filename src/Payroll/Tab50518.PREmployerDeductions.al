table 52193783 "PR Employer Deductions"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            TableRelation = "Employee"."No.";
        }
        field(2; "Transaction Code"; Code[20])
        {
            //TableRelation= "PR Transaction Codes";
            trigger OnValidate()
            var
                TransCodes: Record "PR Transaction Codes";
            begin
                if TransCodes.Get("Transaction Code") then
                    "Transaction Name" := TransCodes."Transaction Name";
            end;
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Period Month"; Integer)
        {
        }
        field(5; "Period Year"; Integer)
        {
        }
        field(6; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }

        field(7; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(8; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(9; "Contract Type"; code[20])
        {
            // OptionMembers = " ","Permanent and Pensionable","Contract","Interns","Casuals";
        }
        field(10; "Posting Group"; Code[20])
        {
            TableRelation = "PR Employee Posting Groups";
        }

        field(11; "Period Closed"; Boolean)
        {
        }

        field(12; "Previous Payment System"; Code[50])
        {
        }
        field(13; "Transaction Name"; Text[150])
        {

        }
    }

    keys
    {
        key(Key1; "Employee Code", "Transaction Code", "Period Month", "Period Year", "Payroll Period")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }
}

