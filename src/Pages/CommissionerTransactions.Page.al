Page 52193939 "Commissioner Transactions"
{
    PageType = Card;
    SourceTable = "Commissioner Transactions1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(MeetingID; "Meeting ID")
                {
                    ApplicationArea = Basic;
                }
                field(MeetingDescription; "Meeting Description")
                {
                    ApplicationArea = Basic;
                }
                field(StartingDate; "Starting Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndingDate; "Ending Date")
                {
                    ApplicationArea = Basic;
                }
                field(Commissioner; Commissioner)
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Member';
                }
                field(BoardMemberName; "Commissioner Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Member Name';
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(EDCode; "E/D Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(GrossAmount; "Gross  Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Tax; Tax)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Net Amount';
                }
                field(Recurring; Recurring)
                {
                    ApplicationArea = Basic;
                }
                field(Paid; Paid)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Attachment; Attachment)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Documents)
            {
                Caption = 'Documents';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Meeting ID", "Language Code(Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Meeting ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Meeting ID";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Meeting ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Meeting ID";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("Meeting ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "Meeting ID";
                            InteractTemplLanguage."Language Code" := "Language Code(Default)";
                            InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachment := Attachment::Yes;
                        Modify;
                    end;
                }
                action(Export)
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Meeting ID", "Language Code(Default)") then
                            InteractTemplLanguage.ExportAttachment;
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("Meeting ID", "Language Code(Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachment := Attachment::No;
                            Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action("Post Payments")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin


                    GenJnlLine.Init;
                    GenJnlLine."Journal Template Name" := 'GENERAL';
                    GenJnlLine."Journal Batch Name" := "Meeting ID";
                    GenJnlLine.DeleteAll;

                    //Commissioner allowance Allowances
                    // SETRANGE("Meeting ID",Rec."Meeting ID");
                    if Find('-') then
                        repeat

                            if Paid = true then
                                Error('The Transaction has already been Posted!!! ');

                            GenJnBatchName."Journal Template Name" := 'GENERAL';

                            GenJnBatchName.Name := "Meeting ID";
                            if not GenJnBatchName.Get(GenJnBatchName."Journal Template Name", GenJnBatchName.Name) then
                                GenJnBatchName.Insert;

                            //positing the Gross Amount Comm Exp payable AC

                            CommPayableSetup.Get;
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'GENERAL';
                            GenJnlLine."Journal Batch Name" := "Meeting ID";
                            GenJnlLine."Line No." := GenJnlLine."Line No." + 1000;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                            if CommissionerED.Get("E/D Code") then
                                AccountNo := CommissionerED."GL Account";
                            GenJnlLine."Account No." := CommPayableSetup."Comm Expense Payable Acc";
                            GenJnlLine.Amount := -Amount;
                            GenJnlLine."Posting Date" := Today;
                            GenJnlLine."Document No." := "Meeting ID";
                            GenJnlLine.Description := Description;

                            //Added By NATHAN

                            // GenJnlLine."ED Code":="E/D Code";
                            // GenJnlLine."Commissioner Name":="Commissioner Name";
                            // GenJnlLine."Shortcut Dimension 2 Code":=Commissioner;
                            // GenJnlLine."Meeting Description":="Meeting Description";
                            // GenJnlLine."Starting Date":="Starting Date";
                            // GenJnlLine."Ending Date":="Ending Date";
                            GenJnlLine."Shortcut Dimension 2 Code" := Commissioner;

                            //Added By NATHAN
                            // GenJnlLine."Meeting ID":="Meeting ID";
                            // GenJnlLine."Meeting Description":="Meeting Description";
                            // GenJnlLine."Starting Date":="Starting Date";
                            // GenJnlLine."Ending Date":="Ending Date";


                            GenJnlLine.Insert;

                            //POSTING TO COMMISSIONER EXPENCE ACCOUNT
                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'GENERAL';
                            GenJnlLine."Journal Batch Name" := "Meeting ID";
                            GenJnlLine."Line No." := GenJnlLine."Line No." + 1000;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                            if CommissionerED.Get("E/D Code") then
                                AccountNo := CommissionerED."GL Account";
                            GenJnlLine."Account No." := AccountNo;
                            GenJnlLine.Amount := "Gross  Amount";
                            GenJnlLine."Posting Date" := Today;
                            GenJnlLine."Document No." := "Meeting ID";
                            GenJnlLine.Description := Description;

                            //Added By NATHAN

                            // GenJnlLine."ED Code" := "E/D Code";
                            // GenJnlLine."Commissioner Name" := "Commissioner Name";
                            // GenJnlLine."Shortcut Dimension 2 Code" := Commissioner;
                            // GenJnlLine."Meeting Description" := "Meeting Description";
                            // GenJnlLine."Starting Date" := "Starting Date";
                            // GenJnlLine."Ending Date" := "Ending Date";

                            //Commissioner Code
                            //GenJnlLine."VAT %":=

                            //GenJnlLine."Bal. Account No.":= CommPayableSetup."Comm Expense Payable Acc";
                            GenJnlLine."Shortcut Dimension 2 Code" := Commissioner;

                            //Added By NATHAN
                            // GenJnlLine."Meeting ID" := "Meeting ID";
                            // GenJnlLine."Meeting Description" := "Meeting Description";
                            // GenJnlLine."Starting Date" := "Starting Date";
                            // GenJnlLine."Ending Date" := "Ending Date";


                            GenJnlLine.Insert;

                            /*
                            JnLineDim.INIT;
                            JnLineDim."Table ID":=81;
                            JnLineDim."Journal Template Name":='GENERAL';
                            JnLineDim."Journal Batch Name":= "Meeting ID";
                            JnLineDim."Journal Line No.":=GenJnlLine."Line No.";
                            JnLineDim."Allocation Line No.":=0;
                            GlSetup.GET;
                            JnLineDim."Dimension Code":=GlSetup."Global Dimension 2 Code";
                            JnLineDim."Dimension Value Code":=Commissioner;
                            JnLineDim.INSERT;
                            */




                            //Tax

                            GenJnlLine.Init;
                            GenJnlLine."Journal Template Name" := 'GENERAL';
                            GenJnlLine."Journal Batch Name" := "Meeting ID";
                            GenJnlLine."Line No." := GenJnlLine."Line No." + 1000;
                            GenJnlLine."Account No." := CommPayableSetup."Comm Tax Acc";
                            GenJnlLine."Posting Date" := Today;
                            GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";
                            GenJnlLine."Document No." := "Meeting ID";
                            GenJnlLine.Description := Description;
                            GenJnlLine.Description := 'Tax(Sitting Alowance)';

                            //Added By NATHAN
                            // GenJnlLine."ED Code" := "E/D Code";
                            // GenJnlLine."Commissioner Name" := "Commissioner Name";
                            // GenJnlLine."Shortcut Dimension 2 Code" := Commissioner;
                            // GenJnlLine."Meeting ID" := "Meeting ID";
                            // GenJnlLine."Meeting Description" := "Meeting Description";
                            // GenJnlLine."Starting Date" := "Starting Date";
                            // GenJnlLine."Ending Date" := "Ending Date";
                            //GenJnlLine."Bal. Account No.":= CommPayableSetup."Comm Expense Payable Acc";
                            GenJnlLine.Amount := -Tax;
                            GenJnlLine."Shortcut Dimension 2 Code" := Commissioner;
                            GenJnlLine.Insert;


                            Paid := true;
                            Modify;
                        /*
                        JnLineDim.INIT;
                        JnLineDim."Table ID":=81;
                        JnLineDim."Journal Template Name":='GENERAL';
                        JnLineDim."Journal Batch Name":= "Meeting ID";
                        JnLineDim."Journal Line No.":=GenJnlLine."Line No.";
                        JnLineDim."Allocation Line No.":=0;
                        GlSetup.GET;
                        JnLineDim."Dimension Code":=GlSetup."Global Dimension 2 Code";
                        JnLineDim."Dimension Value Code":=Commissioner;
                        JnLineDim.INSERT;
                        */


                        until Next = 0;



                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Post Payments_Promoted"; "Post Payments")
                {
                }
            }
        }
    }

    var
        GenJnlLine: Record "Gen. Journal Line";
        DimValue: Record "Dimension Value";
        CommissionerED: Record "Commissioner ED1";
        CommPayableSetup: Record "Commissioner Expe Payables1";
        GenJnBatchName: Record "Gen. Journal Batch";
        AccountNo: Code[10];
        GlSetup: Record "General Ledger Setup";
        DimVal: Record "Dimension Value";
        "G/L Entry": Record "G/L Entry";
}

