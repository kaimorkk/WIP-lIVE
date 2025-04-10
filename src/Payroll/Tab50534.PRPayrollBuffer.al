table 52194059 "PR Payroll Buffer"
{
    Caption = 'PRPayroll Buffer';
    DataClassification = CustomerContent;

    fields
    {

        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }

        field(3; "Payroll-Num"; Code[20])
        {
            Caption = 'Payroll-Num';
        }

        field(5; "BRS Staff No."; Code[50])
        {
            Caption = 'PJ No';
        }

        field(7; "ED-Code"; Code[20])
        {

        }

        field(9; "Transaction Code"; Code[50])
        {
        }

        field(11; "Amount"; Decimal)
        {
            BlankZero = true;
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = Sum("PR Transactions Buffer".Amount where("Document No" = field("Payroll-Num")));
        }

        field(13; "Balance"; Decimal)
        {
            BlankZero = true;
        }

        field(15; "Ref-Account"; Code[50])
        {
        }
        field(16; "Payroll Period"; Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "PR Payroll Periods"."Date Opened" where(Closed = const(false));
        }
        field(17; Status; Option)
        {
            Caption = 'Status';
            OptionCaption = 'Open,Pending Approval,Rejected,Released,Posted';
            OptionMembers = Open,"Pending Approval",Rejected,Released,Posted;

        }
        field(18; "Source Document"; Enum "PayChange Source Document")
        {
        }
        field(19; "Posted By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Posting Date"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Created By"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Payroll-Num")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        HRSetup.Get();
        if "Payroll-Num" = '' then begin
            "Payroll-Num" := NoSeries.GetNextNo(HRSetup."Pay-change No.", 0D, true);
        end;
        "Created By" := UserId;
    end;

    var
        NoSeries: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";

}
