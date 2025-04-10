Table 52193459 "Group Member Applications"
{
    // //DrillDownPageID = UnknownPage51507130;
    // //LookupPageID = UnknownPage51507130;

    fields
    {
        field(1; Application; Code[20])
        {
            // //TableRelation = "Member Applications";
        }
        field(2; "Line No."; Integer)
        {
        }
        field(3; "Constituency Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(4; "Group Code"; Code[20])
        {
        }
        field(5; "ID No."; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin

                // Validating the ID Number
                if "ID No." <> '' then begin

                    // Validating the ID Number in Group Member Application table
                    Reset;
                    SetRange(Application, Application);
                    SetRange("ID No.", "ID No.");
                    if Find('-') then begin
                        Error(Text026, "ID No.");
                    end;



                    //Check ID Number in the Group Members Table
                    Grpmember.Reset;
                    Grpmember.SetRange(Grpmember."ID No.", "ID No.");
                    if Grpmember.Find('-') then begin
                        repeat
                            No := No + 1;
                        until Grpmember.Next = 0;
                        if No >= 1 then
                            Error(Text027, "ID No.", Grpmember."Group Code");
                    end;
                end;
            end;
        }
        field(6; "Member Name"; Text[100])
        {
        }
        field(7; Gender; Option)
        {
            OptionCaption = ' ,Male,Female';
            OptionMembers = " ",Male,Female;
        }
        field(8; "Exist in Other Group"; Boolean)
        {
            Editable = false;
        }
        field(9; "Member of"; Code[100])
        {
            Editable = false;
        }
        field(10; DOB; Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                "Age of Member" := Dates.DetermineAge(DOB, Today);
            end;
        }
        field(11; "Age of Member"; Text[100])
        {
            Editable = false;
        }
        field(12; "Telephone No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; Application, "Line No.")
        {
            Clustered = true;
        }
        key(Key2; "Group Code")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Dim: Record Dimension;
        GLEntry: Record "G/L Entry";
        ItemLedgerEntry: Record "Item Ledger Entry";
        JobLedgEntry: Record "Job Ledger Entry";
        ResLedgEntry: Record "Res. Ledger Entry";
        FALedgerEntry: Record "FA Ledger Entry";
        MaintenanceLedgerEntry: Record "Maintenance Ledger Entry";
        InsCoverageLedgerEntry: Record "Ins. Coverage Ledger Entry";
        VATPostingSetup: Record "VAT Posting Setup";
        TaxJurisdiction: Record "Tax Jurisdiction";
        AdjAddReportingCurr: Report "Adjust Add. Reporting Currency";
        AnalysisView: Record "Analysis View";
        AnalysisViewEntry: Record "Analysis View Entry";
        AnalysisViewBudgetEntry: Record "Analysis View Budget Entry";
        ErrorMessage: Boolean;
        Text000: label '%1 %2 %3 have %4 to %5.';
        Text001: label '%1 %2 have %3 to %4.';
        Text002: label '%1 %2 %3 use %4.';
        Text003: label '%1 %2 use %3.';
        Text004: label '%1 must be rounded to the nearest %2.';
        Text016: label 'Enter one number or two numbers separated by a colon. ';
        Text017: label 'The online Help for this field describes how you can fill in the field.';
        Text018: label 'You cannot change the contents of the %1 field because there are posted ledger entries.';
        Text021: label 'You must close the program and start again in order to activate the amount-rounding feature.';
        Text022: label 'You must close the program and start again in order to activate the unit-amount rounding feature.';
        Text023: label '%1\You cannot use the same dimension twice in the same setup.';
        Text024: label 'You cannot change the contents of the %1 field because the %2 is activated.';
        Text025: label 'The field %1 should not be set to %2 if field %3 in %4 table is set to %5 because deadlocks can occur.';
        BosaSetup: Record "Bosa Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Dates: Codeunit "HR Dates";
        Grpmember: Record "Group Members";
        No: Integer;
        Text026: label 'ID No. %1 already exists in this application';
        Text027: label 'ID No. %1 already exists in Group %2';
}

