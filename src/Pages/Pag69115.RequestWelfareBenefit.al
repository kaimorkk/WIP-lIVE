

page 69115 "Request Welfare  Benefit"
{
    PageType = Card;
    SourceTable = "Hr Welfare Header";


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Welfare No."; Rec."Welfare No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Welfare Code"; Rec."Welfare Code")
                {
                    ApplicationArea = Basic;
                }
                field("Welfare Description"; Rec."Welfare Description")
                {
                    ApplicationArea = Basic;
                }
                field("Welfare Category"; Rec."Welfare Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Benefit Allocation"; Rec."Benefit Allocation")
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
            group("Leave Application")
            {
                Caption = 'Leave Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        // ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."Welfare No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                }
            }
            group(ActionGroup22)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action21)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;

                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action18)
                {
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        /*//if //ApprovalsMgmt.CheckWelfareBenefitApprovalPossible(Rec) THEN
                          //ApprovalsMgmt.OnSendBenefitForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.OnCancelBenefitForApproval(Rec);
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                    end;
                }
                action("Mandatory Attachments")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    RunObject = Page "Benefits Attachments";
                    RunPageLink = "Benefit Category" = field("Welfare Code");
                    RunPageMode = View;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
            group(Category_Process)
            {
                actionref(Release_Promoted; Release)
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Mandatory Attachments_Promoted"; "Mandatory Attachments")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Welfare Type" := Rec."welfare type"::Benefit;
    end;
}

#pragma implicitwith restore

