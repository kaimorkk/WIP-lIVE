Page 52193747 "PV Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "PV Lines";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(AppliestoDocNo; "Applies to Doc. No")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Validate(Description);
                        "Applies to Doc. No" := '';
                        //"Apply to ID":='';

                        Amt := 0;
                        "VAT Amount" := 0;
                        "W/Tax Amount" := 0;
                        "Net Amount" := 0;

                        if "Account Type" = "account type"::Customer then begin

                            CustLedger.Reset;
                            CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                            CustLedger.SetRange(CustLedger."Customer No.", "Account No");
                            CustLedger.SetRange(Open, true);
                            //CustLedger.SETRANGE(CustLedger."Transaction Type",CustLedger."Transaction Type"::"Down Payment");
                            CustLedger.CalcFields(CustLedger.Amount);
                            if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                                if CustLedger."Applies-to ID" <> '' then begin
                                    CustLedger1.Reset;
                                    CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                    CustLedger1.SetRange(CustLedger1."Customer No.", "Account No");
                                    CustLedger1.SetRange(Open, true);
                                    //CustLedger1.SETRANGE("Transaction Type",CustLedger1."Transaction Type"::"Down Payment");
                                    CustLedger1.SetRange("Applies-to ID", CustLedger."Applies-to ID");
                                    if CustLedger1.Find('-') then begin
                                        repeat
                                            CustLedger1.CalcFields(CustLedger1.Amount);
                                            Amt := Amt + Abs(CustLedger1.Amount);
                                        until CustLedger1.Next = 0;
                                    end;

                                    if Amt <> Amt then
                                        //ERROR('Amount is Not equal to the amount applied on the application form');
                                        if Amount = 0 then
                                            Amount := Amt;
                                    "Net Amount" := Amount;
                                    Validate(Amount);
                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    //"Apply to ID":=CustLedger."Applies-to ID";
                                end else begin
                                    if Amount <> Abs(CustLedger.Amount) then
                                        CustLedger.CalcFields(CustLedger."Remaining Amount");
                                    if Amount = 0 then
                                        Amount := Abs(CustLedger."Remaining Amount");
                                    Validate(Amount);
                                    //ERROR('Amount is Not equal to the amount applied on the application form');

                                    "Applies to Doc. No" := CustLedger."Document No.";
                                    // "Apply to ID":=CustLedger."Applies-to ID";

                                end;
                            end;

                            //IF "Apply to ID" <> '' THEN
                            //"Apply to":='';

                            Validate(Amount);
                        end;

                        if "Account Type" = "account type"::Vendor then begin

                            VendLedger.Reset;
                            VendLedger.SetCurrentkey(VendLedger."Vendor No.", Open, "Document No.");
                            VendLedger.SetRange(VendLedger."Vendor No.", "Account No");
                            VendLedger.SetRange(Open, true);
                            //CustLedger.SETRANGE(CustLedger."Transaction Type",CustLedger."Transaction Type"::"Down Payment");
                            VendLedger.CalcFields(VendLedger.Amount);
                            if Page.RunModal(29, VendLedger) = Action::LookupOK then begin

                                if VendLedger."Applies-to ID" <> '' then begin
                                    VendLedger1.Reset;
                                    VendLedger1.SetCurrentkey(VendLedger1."Vendor No.", Open, "Applies-to ID");
                                    VendLedger1.SetRange(VendLedger1."Vendor No.", "Account No");
                                    VendLedger1.SetRange(Open, true);
                                    //CustLedger1.SETRANGE("Transaction Type",CustLedger1."Transaction Type"::"Down Payment");
                                    VendLedger1.SetRange(VendLedger1."Applies-to ID", VendLedger."Applies-to ID");
                                    if VendLedger1.Find('-') then begin
                                        repeat
                                            VendLedger1.CalcFields(VendLedger1.Amount);

                                            Amt := Amt + Abs(VendLedger1.Amount);

                                        until VendLedger1.Next = 0;
                                    end;

                                    if Amt <> Amt then
                                        //ERROR('Amount is Not equal to the amount applied on the application form');
                                        if Amount = 0 then
                                            Amount := Amt;

                                    Validate(Amount);
                                    "Applies to Doc. No" := VendLedger."Document No.";
                                    //"Apply to ID":=CustLedger."Applies-to ID";
                                end else begin
                                    if Amount <> Abs(VendLedger.Amount) then
                                        VendLedger.CalcFields(VendLedger."Remaining Amount");
                                    if Amount = 0 then
                                        Amount := Abs(VendLedger."Remaining Amount");
                                    Validate(Amount);
                                    //ERROR('Amount is Not equal to the amount applied on the application form');

                                    "Applies to Doc. No" := VendLedger."Document No.";
                                    // "Apply to ID":=CustLedger."Applies-to ID";

                                end;
                            end;
                            "Net Amount" := Abs(VendLedger.Amount);
                            //IF "Apply to ID" <> '' THEN
                            //"Apply to":='';

                            Validate(Amount);
                        end;
                    end;
                }
                field(VATCode; "VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field(WTaxCode; "W/Tax Code")
                {
                    ApplicationArea = Basic;
                }
                // field(PayeeCode; "Payee Code")
                // {
                //     ApplicationArea = Basic;
                // }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(WTaxAmount; "W/Tax Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(NetAmount; "Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(VATAmount; "VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ShortcutDimension1Code; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimension2Code; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    ApplicationArea = Basic;
                    CaptionClass = '1,2,3';
                    Visible = true;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        // LookupShortcutDimCode(3, ShortcutDimCode[3]);
                    end;

                    trigger OnValidate()
                    begin
                        ValidateShortcutDimCode(3, ShortcutDimCode[3]);
                    end;
                }
                field(AppliestoDocType; "Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                }
                // field(AmountLCY; "Amount(LCY)")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(PayeeAmount; "Payee Amount")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(PreviewCheck)
            {
                ApplicationArea = Basic;
                Caption = 'P&review Check';
                Image = ViewCheck;
                RuNobject = Page "Check Preview";
                RunPageLink = "Journal Template Name" = const('PAYMENTS'),
                              //   "Journal Batch Name" = field("PV No"),
                              "Line No." = field("Line No");
            }
            action(PrintCheck)
            {
                AccessByPermission = TableData "Check Ledger Entry" = R;
                ApplicationArea = Basic;
                Caption = 'Print Check';
                Ellipsis = true;
                Image = PrintCheck;

                trigger OnAction()
                begin
                    CMSetup.Get;
                    PV.Reset;
                    PV.SetRange(PV."No.", No);
                    if PV.Find('-') then begin

                        //Message(format("PV No"));
                        // Delete Lines Present on the General Journal Lin
                        GenJnLine.Reset;
                        GenJnLine.SetRange(GenJnLine."Journal Template Name", CMSetup."Payment Voucher Template");
                        GenJnLine.SetRange(GenJnLine."Journal Batch Name", PV."No.");
                        GenJnLine.DeleteAll;


                        GenJnLine.Init;
                        GenJnLine."Journal Template Name" := CMSetup."Payment Voucher Template";
                        GenJnLine."Journal Batch Name" := PV."No.";
                        GenJnLine."Line No." := "Line No";
                        GenJnLine."Account Type" := "Account Type";
                        GenJnLine."Account No." := "Account No";
                        GenJnLine.Validate(GenJnLine."Account No.");
                        if PV.Date = 0D then
                            Error('You must specify the PV date');
                        GenJnLine."Posting Date" := PV.Date;
                        GenJnLine."Document No." := PV."No.";
                        GenJnLine."External Document No." := PV."Cheque No";
                        GenJnLine.Description := Description;
                        //GenJnLine."Description 2":=PVLines.Description;
                        GenJnLine.Amount := "Net Amount";
                        GenJnLine.Validate(Amount);
                        // if PV."Pay Mode" = 'CHEQUE' then
                        //     GenJnLine := PV."Pay Mode";
                        GenJnLine."Currency Code" := PV."Currency Code";
                        GenJnLine.Validate(GenJnLine."Currency Code");
                        GenJnLine."Shortcut Dimension 1 Code" := "Shortcut Dimension 1 Code";
                        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 1 Code");
                        GenJnLine."Shortcut Dimension 2 Code" := "Shortcut Dimension 2 Code";
                        //GenJnLine.VALIDATE(GenJnLine."Shortcut Dimension 2 Code");
                        GenJnLine."Dimension Set ID" := "Dimension Set ID";
                        if "Applies to Doc. No" <> '' then begin
                            GenJnLine."Applies-to Doc. Type" := "Applies-to Doc. Type";
                            GenJnLine."Applies-to Doc. No." := "Applies to Doc. No";
                            GenJnLine.Validate(GenJnLine."Applies-to Doc. No.");
                        end;
                        GenJnLine.Insert;
                        Commit;


                        GenJnlLine.Reset;
                        GenJnlLine.Copy(GenJnLine);
                        GenJnlLine.SetRange("Journal Template Name", CMSetup."Payment Voucher Template");
                        GenJnlLine.SetRange("Journal Batch Name", No);
                        DocPrint.PrintCheck(GenJnlLine);
                        Codeunit.Run(Codeunit::"Adjust Gen. Journal Balance", GenJnlLine);
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        // ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnModifyRecord(): Boolean
    begin
        /*
        PaymentsRec.RESET;
        PaymentsRec.SETRANGE(No,"PV No");
        PaymentsRec.SETFILTER(Status,'<>%1',PaymentsRec.Status::Open);
        if PaymentsRec.FIND('-') THEN
           ERROR('You only modify an open record');
                */

    end;

    var
        GenJnLine: Record "Gen. Journal Line";
        DefaultBatch: Record "Gen. Journal Batch";
        RecPayTypes: Record "Receipts and Payment Types1";
        CurrExchRate: Record "Currency Exchange Rate";
        Amt: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        PolicyRec: Record "Sales Invoice Header";
        PremiumControlAmt: Decimal;
        BasePremium: Decimal;
        TotalTax: Decimal;
        TotalTaxPercent: Decimal;
        TotalPercent: Decimal;
        SalesInvoiceHeadr: Record "Sales Cr.Memo Header";
        PaymentsRec: Record Payments;
        ShortcutDimCode: array[8] of Code[20];
        DocPrint: Codeunit "Document-Print";
        CMSetup: Record "Cash Management Setup1";
        PV: Record Payments;
        GenJnlLine: Record "Gen. Journal Line";
}

