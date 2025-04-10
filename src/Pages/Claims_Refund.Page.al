Page 52194219 Claims_Refund
{
    PageType = Card;
    SourceTable = "Request Header1";
    SourceTableView = where(Type = const(Refund),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ClaimDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Claim Date';
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
                field(RemainingAmount; "Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ActualAmount; "Actual Amount")
                {
                    ApplicationArea = Basic;
                }
                field(AppliestoDocNo; "Applies-to Doc. No.")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        "Applies-to Doc. No." := '';
                        //"Apply to ID":='';

                        Amt := 0;
                        //"VAT Amount":=0;
                        //"WTX Amount":=0;


                        CustLedger.Reset;
                        CustLedger.SetCurrentkey(CustLedger."Customer No.", Open, "Document No.");
                        CustLedger.SetRange(CustLedger."Customer No.", "Customer A/C");
                        CustLedger.SetRange(Open, true);
                        //CustLedger.SETRANGE(CustLedger."Transaction Type",CustLedger."Transaction Type"::"Down Payment");
                        CustLedger.CalcFields(CustLedger.Amount);
                        if Page.RunModal(25, CustLedger) = Action::LookupOK then begin

                            if CustLedger."Applies-to ID" <> '' then begin
                                CustLedger1.Reset;
                                CustLedger1.SetCurrentkey(CustLedger1."Customer No.", Open, "Applies-to ID");
                                CustLedger1.SetRange(CustLedger1."Customer No.", "Customer A/C");
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
                                    //ERROR('Amount is not equal to the amount applied on the application form');
                                    if "Total Amount Requested" = 0 then
                                        "Total Amount Requested" := Amt;


                                "Applies-to Doc. No." := CustLedger."Document No.";
                                //"Apply to ID":=CustLedger."Applies-to ID";
                            end else begin
                                if "Total Amount Requested" <> Abs(CustLedger.Amount) then
                                    CustLedger.CalcFields(CustLedger."Remaining Amount");
                                if "Total Amount Requested" = 0 then
                                    "Total Amount Requested" := Abs(CustLedger."Remaining Amount");
                                //VALIDATE(Amount);
                                //ERROR('Amount is not equal to the amount applied on the application form');

                                "Applies-to Doc. No." := CustLedger."Document No.";
                                // "Apply to ID":=CustLedger."Applies-to ID";

                            end;
                        end;

                        //IF "Apply to ID" <> '' THEN
                        //"Apply to":='';

                        Validate("Total Amount Requested");
                        //END;
                    end;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate';
                }
                field(Department; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field(NoofApprovals; "No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Attachement; Attachement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment Done ?';
                    Editable = false;
                }
                field(ExternalApplication; "External Application")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "External Application" = "external application"::Yes then
                            "Customer A/CEditable" := true
                        else
                            "Customer A/CEditable" := false;
                    end;
                }
                field(CustomerAC; "Customer A/C")
                {
                    ApplicationArea = Basic;
                    Editable = "Customer A/CEditable";
                }
            }
            part(Control1000000019; "Imprest_claim Lines")
            {
                SubPageLink = "Document No" = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Attachment)
            {
                Caption = 'Attachment';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ShortCutKey = 'Return';

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then
                            InteractTemplLanguage.OpenAttachment;
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            //InteractTemplLanguage.Description := Description;
                        end;
                        InteractTemplLanguage.CreateAttachment;
                        CurrPage.Update;
                        Attachement := Attachement::Yes;
                        Modify;
                    end;
                }
                action(Copyfrom)
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;
                    Visible = false;

                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            //InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                            Commit;
                        end;
                        InteractTemplLanguage.CopyFromAttachment;
                        CurrPage.Update;
                        Attachement := Attachement::Yes;
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
                        if not InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.Init;
                            InteractTemplLanguage."Interaction Template Code" := "No.";
                            InteractTemplLanguage."Language Code" := "Language Code (Default)";
                            //InteractTemplLanguage.Description := Description;
                            InteractTemplLanguage.Insert;
                        end;
                        InteractTemplLanguage.ImportAttachment;
                        CurrPage.Update;
                        Attachement := Attachement::Yes;
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
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then
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
                        if InteractTemplLanguage.Get("No.", "Language Code (Default)") then begin
                            InteractTemplLanguage.RemoveAttachment(true);
                            Attachement := Attachement::No;
                            Modify;
                        end;
                    end;
                }
            }
        }
        area(processing)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511014, true, true, Rec);
                    Reset;
                end;
            }
            group(Functions)
            {
                Caption = 'Functions';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    begin
                        RequestLines.Reset;
                        RequestLines.SetRange(RequestLines."Document No", "No.");
                        RequestLines.SetFilter(RequestLines.Amount, '<>%1', 0);
                        if RequestLines.Find('-') then
                            repeat
                                if RequestLines."Account No" = '' then
                                    Error('You must select an account for %1', RequestLines.Description);

                            until RequestLines.Next = 0;



                        // //if ApprovalMgt.SendImprestApprovalRequest(Rec) then;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';

                    trigger OnAction()
                    begin
                        // //if ApprovalMgt.CancelImprestApprovalRequest(Rec, true, true) then;
                    end;
                }
                action(Submit)
                {
                    ApplicationArea = Basic;
                    Caption = 'Submit';
                    Visible = false;

                    trigger OnAction()
                    begin
                        CreatePV(Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'Post';
                    Image = Post;

                    trigger OnAction()
                    begin

                        if Status <> Status::Released then
                            Error('The Document cannot be posted before it is fully approved');

                        CreatePV(Rec);

                        /*
                        CALCFIELDS("Total Amount Requested");
                        
                        GenjnLine.INIT;
                        GenjnLine."Journal Template Name":='GENERAL';
                        GenjnLine."Journal Batch Name":='CLAIMS';
                        GenjnLine."Line No.":=GenjnLine."Line No."+10000;
                        GenjnLine."Account Type":=GenjnLine."Account Type"::Customer;
                        GenjnLine."Account No.":="Customer A/C";
                        GenjnLine.Description:='Imprest/Advance Accounting';
                        GenjnLine.Amount:="Total Amount Requested";
                        GenjnLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                        GenjnLine."Document No.":="No.";
                        GenjnLine."Posting Date":="Request Date";
                        IF GenjnLine.Amount<>0 THEN
                        GenjnLine.INSERT;
                        
                        ClaimLines.RESET;
                        ClaimLines.SETRANGE(ClaimLines."Document No","No.");
                        IF ClaimLines.FIND('-') THEN
                        REPEAT
                        
                        GenjnLine.INIT;
                        GenjnLine."Journal Template Name":='GENERAL';
                        GenjnLine."Journal Batch Name":='CLAIMS';
                        GenjnLine."Line No.":=GenjnLine."Line No."+10000;
                        GenjnLine."Account Type":=ClaimLines."Account Type";
                        GenjnLine."Account No.":=ClaimLines."Account No";
                        GenjnLine.Description:=ClaimLines.Description;
                        GenjnLine.Amount:=ClaimLines."Requested Amount";
                        GenjnLine."Shortcut Dimension 1 Code":="Global Dimension 1 Code";
                        GenjnLine."Document No.":="No.";
                        GenjnLine."Posting Date":="Request Date";
                        GenjnLine."External Document No.":=ClaimLines."Reference No";
                        IF GenjnLine.Amount<>0 THEN
                        GenjnLine.INSERT;
                        
                        
                        
                        
                        UNTIL ClaimLines.NEXT=0;
                        
                        GenjnLine.RESET;
                        GenjnLine.SETRANGE(GenjnLine."Journal Template Name",'GENERAL');
                        GenjnLine.SETRANGE(GenjnLine."Journal Batch Name",'CLAIMS');
                        CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post",GenjnLine);
                        
                        */
                        /*
                       //UnCommit Entries

                       RequestLines.SETRANGE(RequestLines."Document No","Imprest/Advance No");
                       IF RequestLines.FINDFIRST THEN BEGIN
                         IF CommittmentEntries.FINDLAST THEN
                         LastEntry:=CommittmentEntries."Entry No";
                        REPEAT
                          LastEntry:=LastEntry+1;
                          CommittmentEntries.INIT;
                          CommittmentEntries."Entry No":=LastEntry;
                          CommittmentEntries."Commitment Date":="Request Date";
                          CommittmentEntries."Document No.":="Imprest/Advance No";
                          CommittmentEntries.Amount:=-RequestLines."Requested Amount";
                          CommittmentEntries."Global Dimension 1 Code":="Global Dimension 1 Code";
                          CommittmentEntries."Commitment Type":=CommittmentEntries."Commitment Type"::IMPREST;
                          CommittmentEntries."Budget Line":=RequestLines."Account No";
                          CommittmentEntries."Global Dimension 2 Code":="Global Dimension 2 Code";
                          CommittmentEntries."User ID":=USERID;
                          CommittmentEntries."Time Stamp":=TIME;
                          CommittmentEntries.Description:=RequestLines.Description;
                          CommittmentEntries.INSERT;
                        UNTIL RequestLines.NEXT=0;
                       END;

                       //End of Commit;

                       //UnCommit Entries

                       //Find the last approver entries

                       ApprovalEntries.RESET;
                       ApprovalEntries.SETRANGE(ApprovalEntries."Table ID",51511126);
                       ApprovalEntries.SETRANGE(ApprovalEntries."Document No.","No.");
                       ApprovalEntries.SETRANGE(ApprovalEntries.Status,ApprovalEntries.Status::Approved);
                       IF ApprovalEntries.FIND('-') THEN
                       BEGIN
                       i:=0;
                       REPEAT
                       i:=i+1;
                       IF i=3 THEN
                       BEGIN
                       EVALUATE(lastApprovalDate,
                       COPYSTR(FORMAT(ApprovalEntries."Last Date-Time Modified"),1,8));

                       //UnCommit Entries
                       RequestLines.SETRANGE(RequestLines."Document No","No.");
                       IF RequestLines.FINDFIRST THEN BEGIN
                         IF CommittmentEntries.FINDLAST THEN
                         LastEntry:=CommittmentEntries."Commitment No";
                        REPEAT
                          LastEntry:=LastEntry+1;
                          CommittmentEntries.INIT;
                          CommittmentEntries."Commitment No":=LastEntry;
                          CommittmentEntries."Commitment Date":=lastApprovalDate;
                          CommittmentEntries."Commitment Type":="No.";
                          CommittmentEntries.Account:=-RequestLines."Requested Amount";
                          CommittmentEntries.User:="Global Dimension 1 Code";
                          CommittmentEntries."Document No":=CommittmentEntries."Document No"::"3";
                          CommittmentEntries."Committed Amount":=RequestLines."Account No";
                          CommittmentEntries.InvoiceNo:="Global Dimension 2 Code";
                          CommittmentEntries.No:=USERID;
                          CommittmentEntries."Entry No":=TIME;
                          CommittmentEntries."Global Dimension 1":=RequestLines.Description;
                          CommittmentEntries.INSERT;
                        UNTIL RequestLines.NEXT=0;
                       END;
                       END;

                       UNTIL ApprovalEntries.NEXT=0;
                       END;

                       IF CommittmentEntries.FIND('-') THEN
                       BEGIN

                       Posted:=TRUE;
                       //"Date Posted":=TODAY;
                       //"Time Posted":=TIME;
                       //"Posted By":=USERID;
                       MODIFY;
                        END;
                       //End of Commit;
                         */

                    end;
                }
                action(Test)
                {
                    ApplicationArea = Basic;
                    Caption = 'Test';
                    Visible = false;

                    trigger OnAction()
                    begin
                        CreatePV(Rec);
                    end;
                }
            }
            action(DMSLink)
            {
                ApplicationArea = Basic;
                Caption = 'DMS Link';
                Enabled = false;
                Visible = false;

                trigger OnAction()
                begin
                    GLSetup.Get();
                    Link := GLSetup."DMS Imprest Claim Link" + "No.";
                    Hyperlink(Link);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(DMSLink_Promoted; DMSLink)
                {
                }
            }
        }
    }

    trigger OnModifyRecord(): Boolean
    begin
        if Status <> Status::Open then
            Error('You cannot make changes at this stage');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Refund;
        if SalesSetup.Get then
            if SalesSetup."Default Transaction Type" <> '' then begin
                "Transaction Type" := SalesSetup."Default Transaction Type";
                Validate("Transaction Type");
            end
            else
                Error('Please setup default transaction type on sales and receivables setup');
    end;

    trigger OnOpenPage()
    begin



        SetRange("User ID", UserId);

        // if UserSetup.Get(UserId) then begin

        //     if UserSetup."Approver ID" = UserId then
        //         SetRange("User ID");
        //     ApprovalTemplate.Reset;
        //     ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::"Request Header1");
        //     ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
        //     if ApprovalTemplate.Find('-') then begin
        //         AdditionalApprovers.Reset;
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID", UserId);
        //         if AdditionalApprovers.Find('+') then
        //             SetRange("User ID");
        //     end;
        //     if ApprovalSetup.Get then
        //         if ApprovalSetup."Approval Administrator" = UserId then
        //             SetRange("User ID");


        //     ApprovalTemplate.Reset;
        //     ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::"Request Header1");
        //     ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
        //     if ApprovalTemplate.Find('-') then begin
        //         AdditionalApprovers.Reset;
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
        //         if AdditionalApprovers.Find('-') then
        //             repeat

        //                 UserSetupRec.Reset;
        //                 UserSetupRec.SetRange(UserSetupRec.Substitute, AdditionalApprovers."Approver ID");
        //                 UserSetupRec.SetRange(UserSetupRec."User ID", UserId);
        //                 if UserSetupRec.Find('-') then
        //                     SetRange("User ID");
        //             until AdditionalApprovers.Next = 0;

        //     end;




        // end;
        // if ApprovalSetup.Get then
        //     if ApprovalSetup."Approval Administrator" = UpperCase(UserId) then
        //         SetRange("User ID");
    end;

    var
        D: Date;
        GenjnLine: Record "Gen. Journal Line";
        ClaimLines: Record "Request Lines1";
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        ApprovalEntry: Record "Approval Entry";
        // AdditionalApprovers: Record "Additional Approvers";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        //ApprovalSetup: Record "User Setup";
        UserSetupRec: Record "User Setup";
        RequestLines: Record "Request Lines1";
        Amt: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        RequestHeader: Record "Request Header1";
        CommittmentEntries: Record "Commitment Register";
        LastEntry: Integer;
        Link: Text[250];
        GLSetup: Record "General Ledger Setup";
        ApprovalEntries: Record "Approval Entry";
        lastApprovalDate: Date;
        i: Integer;
        "G/LAccount": Record "G/L Account";
        "Request Header": Record "Request Header1";
        SalesSetup: Record "Sales & Receivables Setup";

        "Customer A/CEditable": Boolean;
}

