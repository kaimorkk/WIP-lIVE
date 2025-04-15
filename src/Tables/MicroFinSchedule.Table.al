Table 52193578 "Micro Fin Schedule"
{

    fields
    {
        field(1; "No."; Code[10])
        {
            Editable = false;
        }
        field(2; "Transction Type"; Option)
        {
            Enabled = false;
            OptionCaption = 'Savings,Repayment,Interest Paid,Registration Paid,Insurance ,Penalty';
            OptionMembers = Savings,Repayment,"Interest Paid","Registration Paid","Insurance ",Penalty;

            trigger OnValidate()
            begin
                //IF "Transction Type"="Transction Type"::Savings THEN

                //Savings,Repayment,Interest Paid
            end;
        }
        field(3; "Account Type"; Option)
        {
            Enabled = false;
            OptionCaption = 'Customer,Vendor,G/L Account';
            OptionMembers = Customer,Vendor,"G/L Account";

            trigger OnValidate()
            begin

                //Check if transaction type is appropriate
                if "Transction Type" = "transction type"::"Registration Paid" then
                    if "Account Type" <> "account type"::"G/L Account" then
                        Error('The Account type should be g/l account');

                if "Transction Type" = "transction type"::"Insurance " then
                    if "Account Type" <> "account type"::"G/L Account" then
                        Error('The Account type should be g/l account');

                if "Transction Type" = "transction type"::Penalty then
                    if "Account Type" <> "account type"::"G/L Account" then
                        Error('The Account type should be g/l account');


                if "Transction Type" = "transction type"::"Interest Paid" then
                    if "Account Type" <> "account type"::Customer then
                        Error('The Account type should be customer');

                if "Transction Type" = "transction type"::Repayment then
                    if "Account Type" <> "account type"::Customer then
                        Error('The Account type should be customer');

                if "Transction Type" = "transction type"::Savings then
                    if "Account Type" <> "account type"::Vendor then
                        Error('The Account type should be vendor');
            end;
        }
        field(4; "Account Number"; Code[20])
        {
            // TableRelation = Vendor."No." where("Debtor Type" = const("FOSA Account"),
            //                                     "Group Account" = const(false));

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange(Vend."No.", "Account Number");
                if Vend.Find('-') then begin
                    "Account Name" := Vend.Name;
                    // "Group Code" := Vend."Group Code";
                end;
                //Check if blank
                if "Account Number" <> '' then
                    "G/L Account" := '';

                //Check if transaction type is appropriate
                if "Account Number" <> '' then begin
                    //Check if transaction type is appropriate
                    if "Transction Type" = "transction type"::"Registration Paid" then
                        Error('The account type for registration paid should be a G/L Account');
                    if "Transction Type" = "transction type"::"Insurance " then
                        Error('The account type for Insurance  should be a G/L Account');
                    if "Transction Type" = "transction type"::Penalty then
                        Error('The account type for Penalty should be a G/L Account');


                end;
                //Savings,Repayment,Interest Paid,Registration Paid,Insurance ,Penalty
            end;
        }
        field(5; "Account Name"; Text[150])
        {
        }
        field(6; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                RunningBAL := 0;
                RunningBAL := Amount;
                Trans.Reset;
                Trans.SetRange(Trans."No.", "No.");
                if Trans.Find('-') then begin
                    if Trans."Savings/Loan Rep" = Trans."savings/loan rep"::"Loan Repayment" then begin
                        if "Expected Penalty Charge" > 0 then begin
                            if RunningBAL > 0 then begin
                                if RunningBAL > "Expected Penalty Charge" then
                                    "Penalty Amount" := "Expected Penalty Charge"
                                else
                                    "Penalty Amount" := RunningBAL;
                            end;
                            RunningBAL := RunningBAL - "Penalty Amount";
                        end;
                        if "Expected Interest" > 0 then begin
                            if RunningBAL > 0 then begin
                                if RunningBAL > "Expected Interest" then
                                    "Interest Amount" := "Expected Interest"
                                else
                                    "Interest Amount" := RunningBAL;
                            end;
                            RunningBAL := RunningBAL - "Interest Amount";
                        end;

                        if RunningBAL > 0 then
                            "Principle Amount" := RunningBAL;

                    end else
                        Savings := RunningBAL;
                end;
            end;
        }
        field(7; "Loan No."; Code[20])
        {
            // //TableRelation = Loans."Loan No." where ("Oustanding Interest"=filter(>0),
            //                                         "Member No."=field("Account Type"),
            //                                         Source=const(MICRO));
        }
        field(8; "G/L Account"; Code[20])
        {
            Enabled = false;
            TableRelation = "G/L Account"."No.";
        }
        field(9; "Group Code"; Code[20])
        {
        }
        field(10; "Expected Principle Amount"; Decimal)
        {
            Editable = false;
        }
        field(11; "Expected Interest"; Decimal)
        {
            Editable = false;
        }
        field(12; Savings; Decimal)
        {

            trigger OnValidate()
            begin
                /*RunningBAL:=0;
                RunningBAL:=Amount-Savings;
                IF "Expected MF Insurance">0 THEN BEGIN
                IF RunningBAL>0 THEN BEGIN
                IF RunningBAL>"Expected MF Insurance" THEN
                  "MF Insurance Amount":="Expected MF Insurance"
                  ELSE
                   "MF Insurance Amount":=RunningBAL;
                END;
                RunningBAL:=RunningBAL- "MF Insurance Amount";
                END;
                IF "Expected Appraisal">0 THEN BEGIN
                IF RunningBAL>0 THEN BEGIN
                IF RunningBAL>"Expected Appraisal" THEN
                  "Appraisal Amount":="Expected Appraisal"
                  ELSE
                   "Appraisal Amount":=RunningBAL;
                END;
                RunningBAL:=RunningBAL- "Appraisal Amount";
                END;
                
                
                IF "Expected Penalty Charge">0 THEN BEGIN
                IF RunningBAL>0 THEN BEGIN
                IF RunningBAL>"Expected Penalty Charge" THEN
                  "Penalty Amount":="Expected Penalty Charge"
                  ELSE
                   "Penalty Amount":=RunningBAL;
                END;
                RunningBAL:=RunningBAL- "Penalty Amount";
                END;
                
                IF "Expected Interest">0 THEN BEGIN
                IF RunningBAL>0 THEN BEGIN
                IF RunningBAL>"Expected Interest" THEN
                  "Interest Amount":="Expected Interest"
                  ELSE
                  "Interest Amount":=RunningBAL;
                END;
                RunningBAL:=RunningBAL- "Interest Amount";
                END;
                
                
                IF "Expected Principle Amount">0 THEN BEGIN
                IF RunningBAL>0 THEN BEGIN
                 "Principle Amount":=RunningBAL
                END;
                END;
                
                 */


                /*
                IF Amount>("Expected Principle Amount"+"Expected Interest"+"Expected Penalty Charge") THEN BEGIN
                "Interest Amount":="Expected Interest";
                "Principle Amount":="Expected Principle Amount";
                "Penalty Amount":="Expected Penalty Charge";
                Savings:=Amount-("Expected Principle Amount"+"Expected Interest"+"Expected Penalty Charge");
                END;
                IF Amount<("Expected Principle Amount"+"Expected Interest"+"Expected Penalty Charge") THEN BEGIN
                if Amount<"Expected Penalty Charge" then
                   "Penalty Amount":=Amount
                esle if Amount>("Expected Penalty Charge"+"Expected Interest") then
                
                IF Amount<"Expected Interest" THEN
                   "Interest Amount":=Amount
                ELSE BEGIN
                "Interest Amount":="Expected Interest";
                "Principle Amount":=Amount-"Expected Interest";
                END;
                END;
                */

            end;
        }
        field(13; "Interest Amount"; Decimal)
        {
        }
        field(14; "Principle Amount"; Decimal)
        {
        }
        field(15; "Expected Penalty Charge"; Decimal)
        {
        }
        field(16; "Penalty Amount"; Decimal)
        {
        }
        field(17; "Expected MF Insurance"; Decimal)
        {
        }
        field(18; "MF Insurance Amount"; Decimal)
        {
        }
        field(19; "Expected Appraisal"; Decimal)
        {
        }
        field(20; "Appraisal Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "No.", "Account Number")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Trans.Reset;
        if Trans.Get("No.") then
            if Trans.Posted = true then
                Error('Cannot delete a posted transaction');
    end;

    trigger OnInsert()
    begin
        Trans.Reset;
        if Trans.Get("No.") then
            if Trans.Posted = true then
                Error('Cannot modify a posted transaction');
    end;

    trigger OnModify()
    begin
        Trans.Reset;
        if Trans.Get("No.") then
            if Trans.Posted = true then
                Error('Cannot modify a posted transaction');
    end;

    trigger OnRename()
    begin
        Trans.Reset;
        if Trans.Get("No.") then
            if Trans.Posted = true then
                Error('Cannot modify a posted transaction');
    end;

    var
        Vend: Record Vendor;
        Trans: Record "Micro Fin Transactions";
        GL: Record "G/L Account";
        RunningBAL: Decimal;
}

