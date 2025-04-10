Table 52194011 "HR Bank Summary"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
        }
        field(2; "Bank Code"; Code[10])
        {
            TableRelation = "PR Bank Accounts"."Bank Code";
        }


        field(3; "Branch Code"; Code[10])
        {
            TableRelation = "PR Bank Branches"."Branch Code";
        }
        field(4; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(5; Amount; Decimal)
        {
        }
        field(6; "Transaction Code"; Code[10])
        {
        }
        field(7; "No.";
        Code[20])
        {
            TableRelation = "Employee"."No.";
        }
        field(8; "% NPAY"; Decimal)
        {
        }
        field(9; "Bank Name"; Text[100])
        {
        }
        field(10; "Branch Name"; Text[100])
        {
        }
        field(11; "Bank Type"; Option)
        {
            CalcFormula = lookup("PR Bank Accounts"."Bank Type" where("Bank Code" = field("Bank Code")));
            Editable = false;
            FieldClass = FlowField;
            OptionMembers = Bank,Sacco;
        }
        field(12; "Staff Bank Name"; Text[100])
        {
        }
        field(13; "A/C Number"; Text[100])
        {
        }
        field(29; "Employment Date"; Date)
        {
            Caption = 'Employment Date';
        }
        field(50000; Status; Option)
        {
            CalcFormula = lookup("Employee".Status where("No." = field("No.")));
            FieldClass = FlowField;
            OptionMembers = New,"Pending Approval",Active,InActive;

            trigger OnValidate()
            var
                PRPayrollPeriod: Record "PR Payroll Periods";
                PREmployerDeduc: Record "PR Employer Deductions";
            begin
            end;
        }
        field(50001; "Posting Group"; Code[20])
        {
            TableRelation = "PR Employee Posting Groups";
        }
        field(50002; "Employee Type"; Enum "Employee Type")
        {
            //OptionMembers = Normal,Secondary,Intern,Attachee;
        }

        field(50003; "Bank and Branch Code"; Code[20])
        {

        }
        field(50118; "Last Promotion Date"; Date)
        {
        }
        field(50165; "Salary Scale"; Code[30])
        {
        }
        field(69601; "Current Duty Station"; Code[30])
        {
        }
        field(70018; "Directorate Code"; Code[50])
        {
            Caption = 'Implementing Unit';
        }
        field(70064; "Job Title2"; Text[250])
        {
            Caption = 'Designation';
        }

        field(70091; "Organisation Unit Name"; Text[100])
        {
        }
        field(70092; "Implementing Unit Name"; Text[100])
        {
        }
        field(70093; "Employee Category Type"; Option)
        {
            OptionCaption = '"...",Attachee,Casual,Intern,Judge,Judicial Officer,Judicial Staff,Pupillage,Temporary';
            OptionMembers = "...",Attachee,Casual,"Intern","Judge","Judicial Officer","Judicial Staff","Pupillage","Temporary";
        }
        field(70094; "Salary Notch"; Code[30])
        {
        }


    }

    keys
    {
        key(Key1; "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

