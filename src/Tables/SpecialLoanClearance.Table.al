Table 52193483 "Special Loan Clearance"
{
    DrillDownPageID = "Special Loan Clearance";
    LookupPageID = "Special Loan Clearance";

    fields
    {
        field(1; "Loan No."; Code[20])
        {
            //TableRelation = Loans."Loan No.";
        }
        field(2; "Loan Off Set"; Code[20])
        {
            //TableRelation = Loans."Loan No." where ("Member No."=field("Client Code"),
            // Posted =const(true),
            // "Outstanding Balance"=filter(>0));

            trigger OnValidate()
            begin
                "Loan Type" := '';
                "Principle Off Set" := 0;
                "Interest Off Set" := 0;
                "Total Off Set" := 0;

                // Loans.Reset;
                // Loans.SetRange(Loans."Loan No.", "Loan Off Set");
                // if Loans.Find('-') then begin
                //     Loans.CalcFields(Loans."Outstanding Balance", Loans."Interest Due");
                //     "Loan Type" := Loans."Loan Product Type";
                //     "Principle Off Set" := Loans."Outstanding Balance";
                //     "Interest Off Set" := Loans."Interest Due";
                //     "Total Off Set" := "Principle Off Set";
                //     "Monthly Repayment" := Loans.Repayment;
                // end;
            end;
        }
        field(3; "Client Code"; Code[20])
        {
        }
        field(4; "Loan Type"; Code[20])
        {
        }
        field(5; "Principle Off Set"; Decimal)
        {

            trigger OnValidate()
            begin
                // Loans.Reset;
                // Loans.SetRange(Loans."Loan No.", "Loan Off Set");
                // if Loans.Find('-') then begin
                //     Loans.CalcFields(Loans."Outstanding Balance");
                //     if "Principle Off Set" > Loans."Outstanding Balance" then
                //         Error('Amount cannot be greater than the loan oustanding balance.');

                // end;

                "Total Off Set" := "Principle Off Set" + "Interest Off Set";
            end;
        }
        field(6; "Interest Off Set"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Off Set" := "Principle Off Set" + "Interest Off Set";

                // Loans.Reset;
                // Loans.SetRange(Loans."Loan No.", "Loan Off Set");
                // if Loans.Find('-') then begin
                //     Loans.CalcFields(Loans."Interest Due");
                //     if "Principle Off Set" > Loans."Outstanding Balance" then
                //         Error('Amount cannot be greater than the interest due.');

                // end;
            end;
        }
        field(7; "Total Off Set"; Decimal)
        {
        }
        field(8; "Monthly Repayment"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Loan No.", "Client Code")
        {
            Clustered = true;
            SumIndexFields = "Total Off Set";
        }
    }

    fieldgroups
    {
    }

    var
    //Loans: Record Loans;
}

