TableExtension 52193430 tableextension52193430 extends "G/L Account"
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Business Unit Filter"(Field 42)".

        field(50000; "Commitment Amount"; Decimal)
        {
            CalcFormula = sum("Commitment Register"."Committed Amount" where(Account = field("No.")));
            FieldClass = FlowField;
        }
        field(50001; "Procurement Plan Amount"; Decimal)
        {
            CalcFormula = sum("Procurement Plan1"."Estimated Cost" where("Source of Funds" = field("No."),
                                                                          "Plan Year" = field("Budget Filter"),
                                                                          "Department Code" = field("Global Dimension 1 Filter")));
            FieldClass = FlowField;
        }
        field(50002; "Requisition Amount"; Decimal)
        {
        }
        field(50003; "Show on Claim"; Boolean)
        {
        }
        field(50004; "Asset Code Mandatory"; Boolean)
        {
        }
        field(50005; "Asset Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Fixed Asset";
        }
        field(50006; "Imprest/Loan Code Mandatory"; Boolean)
        {
        }
        field(50007; "Income/Expense"; Option)
        {
            OptionCaption = 'Income,Expense';
            OptionMembers = Income,Expense;

            trigger OnValidate()
            begin

                if (("Income/Expense" <> xRec."Income/Expense")) then begin// (xRec."Income/Balance" <> '') AND

                    AccountEvent.SetMessage('Income/Expense Changed');
                    AccountEvent.RunModal;
                    //  OK:= AccountEvent.ReturnResult;
                    // IF OK THEN BEGIN
                    AccountHistory.Init;
                    if not AccountHistory.Find('-') then
                        AccountHistory."Line No." := AccountHistory."Line No."
                    else begin
                        AccountHistory.Find('+');
                        AccountHistory."Line No." := AccountHistory."Line No." + 1;
                    end;

                    AccountHistory."Account No." := "No.";
                    AccountHistory."Date Of Event" := Today;
                    AccountHistory."Description of  Event" := 'Income/Expense Changed';
                    AccountHistory."Account Name" := Name;
                    AccountHistory."Old Value" := Format(xRec."Income/Expense", 0, 9);
                    AccountHistory."New Value" := Format("Income/Expense", 0, 9);
                    AccountHistory.Reason := AccountEvent.ReturnReason;
                    AccountHistory.Insert;
                end;
            end;
        }
        field(50008; Type; Option)
        {
            OptionCaption = ' ,Asset,Liability,Income,Expense,Equity';
            OptionMembers = " ",Asset,Liability,Income,Expense,Equity;

            trigger OnValidate()
            begin

                if ((Type <> xRec.Type)) then begin// (xRec."Income/Balance" <> '') AND

                    AccountEvent.SetMessage('Account Type Changed');
                    AccountEvent.RunModal;
                    //  OK:= AccountEvent.ReturnResult;
                    // IF OK THEN BEGIN
                    AccountHistory.Init;
                    if not AccountHistory.Find('-') then
                        AccountHistory."Line No." := AccountHistory."Line No."
                    else begin
                        AccountHistory.Find('+');
                        AccountHistory."Line No." := AccountHistory."Line No." + 1;
                    end;

                    AccountHistory."Account No." := "No.";
                    AccountHistory."Date Of Event" := Today;
                    AccountHistory."Description of  Event" := 'Account Type Changed';
                    AccountHistory."Account Name" := Name;
                    AccountHistory."Old Value" := Format(xRec.Type, 0, 9);
                    AccountHistory."New Value" := Format(Type, 0, 9);
                    AccountHistory.Reason := AccountEvent.ReturnReason;
                    AccountHistory.Insert;
                end;
            end;
        }
        field(50009; "Revised Budget"; Decimal)
        {
            CalcFormula = sum("G/L Budget Entry".Amount where("G/L Account No." = field("No."),
                                                               "G/L Account No." = field(filter(Totaling)),
                                                               "Business Unit Code" = field("Business Unit Filter"),
                                                               "Global Dimension 1 Code" = field("Global Dimension 1 Filter"),
                                                               "Global Dimension 2 Code" = field("Global Dimension 2 Filter"),
                                                               Date = field("Date Filter"),
                                                               "Budget Name" = field("Budget Filter"),
                                                               "Budget Type" = const(Revised)));
            FieldClass = FlowField;
        }
        field(50010; "Block Budget Transfer"; Boolean)
        {
        }
        field(50011; "Requested By"; Code[30])
        {
            TableRelation = "User Setup";
        }
        field(50012; "Effective Date"; Date)
        {
        }
        field(50013; "Employee Code Mandatory"; Boolean)
        {
        }
    }


    //Unsupported feature: Property Modification (Id) on "GLSetup(Variable 1002)".

    //var
    //>>>> ORIGINAL VALUE:
    //GLSetup : 1002;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //GLSetup : 1009;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CostAccSetup(Variable 1006)".

    //var
    //>>>> ORIGINAL VALUE:
    //CostAccSetup : 1006;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CostAccSetup : 1008;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "DimMgt(Variable 1003)".

    //var
    //>>>> ORIGINAL VALUE:
    //DimMgt : 1003;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //DimMgt : 1007;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "CostAccMgt(Variable 1007)".

    //var
    //>>>> ORIGINAL VALUE:
    //CostAccMgt : 1007;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //CostAccMgt : 1006;
    //Variable type has not been exported.
    procedure GetGrouping(AccountNo: Code[20]): Code[20]
    var
        GLAcc: Record "G/L Account";
    begin
        GLAcc.Reset();
        GLAcc.SetLoadFields("No.", "Account Type");
        GLAcc.SetCurrentKey("No.");
        GLACC.SetFilter("No.", '<%1', AccountNo);
        GLAcc.SetFilter("Account Type", '%1|%2', GLAcc."Account Type"::"Begin-Total", GLAcc."Account Type"::"End-Total");
        if GLAcc.FindLast() then
            exit(GLAcc."No.");
    end;

    var
        AccountHistory: Record "Account History";
        AccountEvent: Page "Account Event Option Box";
}

