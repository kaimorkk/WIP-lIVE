table 50070 "Medical Scheme Entitlements"
{
    Caption = 'Medical Scheme Entitlements';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Scheme No"; Code[20])
        {
            Caption = 'Scheme No';
        }
        field(2; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(3; "Job Grade"; Code[20])
        {
            Caption = 'Job Grade';
            TableRelation = "Salary Scales";
            trigger OnValidate()
            var
                Scales: Record "Salary Scales";
                Coverage: Record "Medical Scheme Coverage";
            begin
                if Scales.Get("Job Grade") then
                    Description := Scales.Description;
                Coverage.Reset();
                Coverage.SetRange(Coverage."Scheme No", "Scheme No");
                Coverage.SetRange(Coverage.Code, "Code");
                if Coverage.find('-') then begin
                    "Bed Limit" := Coverage."Bed Limit";
                    "Maternity Limit" := Coverage."Maternity Limit";
                    "Dental Limit" := Coverage."Dental Limit";
                    "Optical Limit" := Coverage."Optical Limit";
                    "Last Expense Limit" := Coverage."Last Expense Limit";
                    "Psychiatric Condition Limit" := Coverage."Psychiatric Condition Limit";
                    "Chronic Illness Limit" := Coverage."Chronic Illness Limit";
                    "First Caeserian Section" := Coverage."First Caeserian Section";
                    "Post hospitalization" := Coverage."Post hospitalization";
                    "External Aids" := Coverage."External Aids";


                end;
            end;
        }
        field(4; Description; Text[1000])
        {
            Caption = 'Description';
        }
        field(9; "Maximum Cover"; Decimal)
        {
        }
        field(69605; "Maximum Car Loan"; Decimal)
        {
        }
        field(69606; "Maximum Mortage Loan"; Decimal)
        {
        }
        field(69607; "Bed Limit"; Decimal)
        {
        }
        field(69608; "Maternity Limit"; Decimal)
        {
        }
        field(69609; "Dental Limit"; Decimal)
        {
        }
        field(69610; "Optical Limit"; Decimal)
        {
        }
        field(69611; "In Patient Limit"; Decimal)
        {
        }
        field(69612; "Out Patient Limit"; Decimal)
        {
        }

        field(69613; "Congenital Condition Limit"; Decimal)
        {
        }
        field(69614; "Last Expense Limit"; Decimal)
        {
        }
        field(69632; "Psychiatric Condition Limit"; Decimal)
        {
        }
        field(69633; "Chronic Illness Limit"; Decimal)
        {
        }
        field(69634; "First Caeserian Section"; Decimal)
        {
        }
        field(69635; "Post hospitalization"; Decimal)
        {
        }
        field(69636; "External Aids"; Decimal)
        {
        }
        field(69637; "Health Checkups"; Decimal)
        {
        }
    }
    keys
    {
        key(PK; "Scheme No", "Code", "Job Grade")
        {
            Clustered = true;
        }
    }
}
