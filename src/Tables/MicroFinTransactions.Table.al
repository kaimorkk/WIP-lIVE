Table 52193577 "Micro Fin Transactions"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = true;
        }
        field(2; "Transaction Date"; Date)
        {
            Editable = true;
        }
        field(3; "Transaction Time"; Time)
        {
            Editable = true;
        }
        field(4; "Micro Saver Control Account"; Code[20])
        {
            Editable = true;
            TableRelation = Vendor."No.";
        }
        field(5; "Group Code"; Code[20])
        {
            Editable = true;
            // TableRelation = Vendor."No." where("Debtor Type" = const("FOSA Account"),
            //                                     "Group Account" = const(true));

            trigger OnValidate()
            begin
                if Posted <> true then begin
                    MicroSubform.Reset;
                    MicroSubform.SetRange(MicroSubform."No.", "No.");
                    if MicroSubform.Find('-') then
                        MicroSubform.DeleteAll;
                    GroupMembers.Reset;
                    // GroupMembers.SetRange(GroupMembers."Group Code", "Group Code");
                    if GroupMembers.Find('-') then begin
                        repeat
                            MicroSubform.Init;
                            MicroSubform."No." := "No.";
                            MicroSubform."Account Number" := GroupMembers."No.";
                            MicroSubform."Account Name" := GroupMembers.Name;
                            MicroSubform."Group Code" := "Group Code";
                            // LoanApplic.Reset;
                            // LoanApplic.SetRange(LoanApplic.Source, LoanApplic.Source::MICRO);
                            // LoanApplic.SetRange(LoanApplic."Member No.", GroupMembers."No.");
                            // LoanApplic.SetFilter(LoanApplic."Outstanding Balance", '>0');
                            // if LoanApplic.Find('-') then begin
                            //     LoanApplic.CalcFields(LoanApplic."Outstanding Balance", LoanApplic."Interest Due", LoanApplic."Oustanding Interest");

                            //     if LoanApplic."Outstanding Balance" > 0 then begin
                            //         MicroSubform."Expected Principle Amount" := LoanApplic.Repayment;
                            //         MicroSubform."Expected Interest" := LoanApplic."Oustanding Interest";
                            //         MicroSubform."Loan No." := LoanApplic."Loan No.";
                            //     end;
                            // end;
                            MicroSubform.Insert;
                        until GroupMembers.Next = 0;
                    end;
                end;
            end;
        }
        field(6; Amount; Decimal)
        {
            Editable = true;
        }
        field(7; Balance; Decimal)
        {
        }
        field(8; Posted; Boolean)
        {
            Editable = false;
        }
        field(9; "Posted By"; Code[20])
        {
            Editable = false;
        }
        field(10; "Transactons Total"; Decimal)
        {
            CalcFormula = sum("Micro Fin Schedule".Amount where("No." = field("No.")));
            FieldClass = FlowField;
        }
        field(11; "Bank  Acount"; Code[20])
        {
            TableRelation = "Bank Account"."No.";
        }
        field(12; "No. Series"; Code[10])
        {
        }
        field(13; "Savings/Loan Rep"; Option)
        {
            OptionMembers = Savings,"Loan Repayment";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        if Posted then
            Error('Cannot delete a posted transaction');
    end;

    trigger OnInsert()
    begin
        /*IF "No." = '' THEN BEGIN
           SalesSetup.GET(0);
           SalesSetup.TESTFIELD(SalesSetup."Mf-Trans Nos");
           noseriesmgt.InitSeries(SalesSetup."Mf-Trans Nos",xRec."No. Series",0D,"No.",xRec."No. Series");
        END;
        */
        if "No." = '' then begin
            SalesSetup.Get;
            SalesSetup.TestField(SalesSetup."Mf-Trans Nos");
            noseriesmgt.InitSeries(SalesSetup."Mf-Trans Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;

    end;

    trigger OnModify()
    begin
        if Posted then
            Error('Cannot modify a posted transaction');
    end;

    var
        MicroSubform: Record "Micro Fin Schedule";
        GroupMembers: Record Vendor;
        // LoanApplic: Record Loans;
        noseriesmgt: Codeunit NoSeriesManagement;
        SalesSetup: Record "Sales & Receivables Setup";
}

