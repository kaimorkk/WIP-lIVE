
table 69129 "Employee Leaves"
{
    DrillDownPageID = "Posted Leave Days";
    LookupPageID = "Posted Leave Days";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No"; Code[20])
        {
            NotBlank = false;
            TableRelation = Employee."No.";
        }
        field(2; "Leave Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = "HR Leave Types".Code;

            trigger OnValidate()
            begin


                /*
                "Leave Types".RESET;
                "Leave Types".SETRANGE("Leave Types".Code,"Leave Code");
                IF "Leave Types".FIND('-') THEN BEGIN;
                IF "Leave Types".Gender <> "Leave Types".Gender::Both THEN BEGIN
                EmployeeRec.RESET;
                EmployeeRec.SETRANGE(EmployeeRec."No.","Employee No");
                IF "Leave Types".Gender = "Leave Types".Gender::Female THEN BEGIN
                IF EmployeeRec.Gender <> EmployeeRec.Gender::Female THEN BEGIN
                "Leave Code":='';
                Balance:=0;
                ERROR('%1','You cannot assign this employee this leave.');
                END;
                END
                ELSE
                Balance:="Leave Types".Days;
                END
                ELSE
                Balance:="Leave Types".Days;
                END;
                
                Balance:="Leave Types".Days;
                
                */

            end;
        }
        field(3; "Posting  Date"; Date)
        {
        }
        field(4; "No. Of Days"; Integer)
        {

            trigger OnValidate()
            begin
                TestField("Adjustment Type");
                if "Adjustment Type" = "adjustment type"::"Positive Adjustment" then begin
                    if "No. Of Days" <= 0 then
                        Error('NO. OF DAYS MUST BE POSITIVE.PLEASE CHECK!!')
                end;

                if "Adjustment Type" = "adjustment type"::"Negative Adjustment" then begin
                    if "No. Of Days" >= 0 then
                        Error('NO. OF DAYS MUST BE NEGATIVE.PLEASE CHECK!!')
                end;
            end;
        }
        field(5; "Acrued Days"; Integer)
        {
            Editable = false;
        }
        field(6; "Total Days Taken"; Integer)
        {
            FieldClass = Normal;
        }
        field(7; Entitlement; Integer)
        {
        }
        field(8; "Balance Brought Forward"; Integer)
        {
        }
        field(9; "Recalled Days"; Integer)
        {
            FieldClass = Normal;
        }
        field(10; "From Date"; Date)
        {
        }
        field(11; "To Date"; Date)
        {
        }
        field(12; "First Name"; Text[100])
        {
            CalcFormula = lookup(Employee."First Name" where("No." = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Last Name"; Text[100])
        {
            CalcFormula = lookup(Employee."Last Name" where("No." = field("Employee No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14; Description; Text[100])
        {
        }
        field(15; Posted; Boolean)
        {

            trigger OnValidate()
            begin
                TestField("Adjustment Type");
                TestField("No. Of Days");
                if "No. Of Days" = 0 then
                    Error('Input No. of Days');
            end;
        }
        field(16; "Adjustment Type"; Option)
        {
            OptionMembers = " ","Negative Adjustment","Positive Adjustment";
        }
        field(17; "Document No."; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Employee No", "Leave Code", "Posting  Date")
        {
            Clustered = true;
            SumIndexFields = "No. Of Days";
        }
    }

    fieldgroups
    {
    }

    var
        "Leave Types": Record "HR Leave Types";
        EmployeeRec: Record Employee;
}

