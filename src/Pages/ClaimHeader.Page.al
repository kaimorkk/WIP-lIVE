Page 52193915 "Claim Header"
{
    PageType = Card;
    SourceTable = "Request Header1";

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
                field(SurrenderDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Surrender Date';
                    Editable = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(CustomerAC; "Customer A/C")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(ImprestAdvanceNo; "Imprest/Advance No")
                {
                    ApplicationArea = Basic;
                }
                field(PurposeofImprest; "Purpose of Imprest")
                {
                    ApplicationArea = Basic;
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
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
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
                    Visible = false;
                }
                field(CBKWebsiteAddress; "CBK Website Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
            part(Control1000000019; "Claim Accounting Lines")
            {
                SubPageLink = "Document No" = field("No.");
            }
            part(Control1; "Group Imprest Lines")
            {
                Editable = GroupImprest;
                SubPageLink = "Imprest No" = field("No.");
                Visible = GroupImprest;
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
                    Visible = true;

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
                    Report.Run(51511459, true, true, Rec);
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
                    Visible = false;

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
                        */
                        if CommittmentEntries.Find('-') then begin

                            Posted := true;
                            //"Date Posted":=TODAY;
                            //"Time Posted":=TIME;
                            //"Posted By":=USERID;
                            Modify;
                        end;
                        //End of Commit;

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
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if "Imprest Type" = "imprest type"::Group then
            GroupImprest := true;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        if Status <> Status::Open then
            Error('You cannot make changes at this stage');
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::"Claim-Accounting";
    end;

    trigger OnOpenPage()
    begin

        /*
        
           SETRANGE("User ID",USERID);
        
           IF UserSetup.GET(USERID) THEN
           BEGIN
        
           IF UserSetup."Approver ID"=USERID THEN
           SETRANGE("User ID");
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Request Header1");
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approver ID",USERID);
           IF AdditionalApprovers.FIND('+') THEN
           SETRANGE("User ID");
           END;
           IF ApprovalSetup.GET THEN
           IF ApprovalSetup."Approval Administrator"=USERID THEN
           SETRANGE("User ID");
        
        
           ApprovalTemplate.RESET;
           ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Request Header1");
           ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
           IF ApprovalTemplate.FIND('-') THEN
           BEGIN
           AdditionalApprovers.RESET;
           AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
           IF AdditionalApprovers.FIND('-') THEN
           REPEAT
        
            UserSetupRec.RESET;
            UserSetupRec.SETRANGE(UserSetupRec.Substitute,AdditionalApprovers."Approver ID");
            UserSetupRec.SETRANGE(UserSetupRec."User ID",USERID);
            IF UserSetupRec.FIND('-') THEN
            SETRANGE("User ID");
           UNTIL AdditionalApprovers.NEXT=0;
        
           END;
        
        
        
        
           END;
           IF ApprovalSetup.GET THEN
           IF ApprovalSetup."Approval Administrator"=UPPERCASE(USERID) THEN
           SETRANGE("User ID");
        
        */
        if "Imprest Type" = "imprest type"::Group then
            GroupImprest := true;

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
        // ApprovalSetup: Record "Approval Setup";
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

        GroupImprest: Boolean;
}

