Page 50120 "Imprest Surrender Archived"
{
    CardPageID = "Posted Claims Accounting";
    Editable = false;
    PageType = List;
    SourceTable = "Request Header1";
    SourceTableView = where(Type = const("Claim-Accounting"),
                            Archived = const(true));

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ClaimAccountingDate; "Request Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Claim/Accounting Date';
                }
                field(ImprestAdvanceNo; "Imprest/Advance No")
                {
                    ApplicationArea = Basic;
                }
                field(TripNo; "Trip No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(TripStartDate; "Trip Start Date")
                {
                    ApplicationArea = Basic;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*frmcalendar.SetDate("Trip Start Date");
                        frmcalendar.RUNMODAL;
                        D := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF D <> 0D THEN
                          "Trip Start Date" := D;
                          */

                    end;
                }
                field(TripEndDate; "Trip Expected End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Trip End Date';

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        /*frmcalendar.SetDate("Trip Expected End Date");
                        frmcalendar.RUNMODAL;
                        D := frmcalendar.GetDate;
                        CLEAR(frmcalendar);
                        IF D <> 0D THEN
                          "Trip Expected End Date" := D;
                         VALIDATE("Trip Expected End Date");
                        */

                    end;

                    trigger OnValidate()
                    begin
                        if Type = Type::Order then begin
                            Validate("Imprest/Advance No");
                        end;
                    end;
                }
                field(NoofDays; "No. of Days")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(DeadlineforImprestReturn; "Deadline for Imprest Return")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
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
                field(TotalAmountRequested; "Total Amount Requested")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoofApprovals; "No of Approvals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ImprestAmount; "Imprest Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Attachement; Attachement)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment Done ?';
                    Editable = false;
                }
                field(Paid; Paid)
                {
                    ApplicationArea = Basic;
                }
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
            action("<Action 708>")
            {
                ApplicationArea = Basic;
                Caption = 'Paid ';
                Image = Salutation;

                trigger OnAction()
                begin
                    Paid := true;
                    Modify;
                end;
            }
            group(Functions)
            {
                Caption = 'Functions';
                Visible = false;
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

                        CreatePV(Rec);
                        if Posted then
                            Error('The transaction has already been posted.');


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

                        //UnCommit Entries

                        //Find the last approver entries
                        ApprovalEntries.Reset;
                        ApprovalEntries.SetRange(ApprovalEntries."Table ID", 51511126);
                        ApprovalEntries.SetRange(ApprovalEntries."Document No.", "No.");
                        ApprovalEntries.SetRange(ApprovalEntries.Status, ApprovalEntries.Status::Approved);
                        if ApprovalEntries.Find('-') then begin
                            i := 0;
                            repeat
                                i := i + 1;
                                if i = 3 then begin
                                    Evaluate(lastAppovalDate,
                                    CopyStr(Format(ApprovalEntries."Last Date-Time Modified"), 1, 8));
                                    /*
                                    //UnCommit Entries
                                    RequestLines.SETRANGE(RequestLines."Document No","No.");
                                    IF RequestLines.FINDFIRST THEN BEGIN
                                      IF CommittmentEntries.FINDLAST THEN
                                    //  LastEntry:=CommittmentEntries."Entry No";
                                     REPEAT
                                       LastEntry:=LastEntry+1;
                                       CommittmentEntries.INIT;
                                      // CommittmentEntries."Entry No":=LastEntry;
                                      // CommittmentEntries."Commitment Date":=lastAppovalDate;
                                       CommittmentEntries."Document No":="No.";
                                       CommittmentEntries.Amount:=-RequestLines."Requested Amount";
                                       CommittmentEntries."Global Dimension 1 Code":="Global Dimension 1 Code";
                                       CommittmentEntries."Commitment Type":=CommittmentEntries."Commitment Type"::"3";
                                       CommittmentEntries."Budget Line":=RequestLines."Account No";
                                       CommittmentEntries."Global Dimension 2 Code":="Global Dimension 2 Code";
                                       CommittmentEntries."User ID":=USERID;
                                       CommittmentEntries."Time Stamp":=TIME;
                                       CommittmentEntries.Description:=RequestLines.Description;
                                       CommittmentEntries.INSERT;
                                     UNTIL RequestLines.NEXT=0;
                                    END;
                                    */
                                end;

                            until ApprovalEntries.Next = 0;
                        end;

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
         ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
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
         ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::Table59018);
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
        CommittmentEntries: Record "Request Lines1";
        LastEntry: Integer;
        Link: Text[250];
        GLSetup: Record "General Ledger Setup";
        ApprovalEntries: Record "Approval Entry";
        lastAppovalDate: Date;
        i: Integer;
}

