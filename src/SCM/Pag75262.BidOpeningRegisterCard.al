

page 75262 "Bid Opening Register Card"
{
    PageType = Card;
    SourceTable = "Bid Opening Register";


    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Region"; Rec."Primary Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Region field.';
                }
                field("Bid Envelop Type"; Rec."Bid Envelop Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Envelop Type field.';
                }
                field("Tender Name"; Rec."Tender Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Name field.';
                }
                field("Appointed Bid Opening Com"; Rec."Appointed Bid Opening Com")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tender Opening Committee Code';
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Tender Opening Committee Code field.';
                }
                field("Bid Opening End Date"; Rec."Bid Opening End Date")
                {
                    ApplicationArea = Basic;
                    Editable = rec."Is Refloated";
                    Caption = 'Bid Submission End Date';
                    ToolTip = 'Specifies the value of the Bid Opening End Date field.';
                }
                field("Bid Opening End Time"; Rec."Bid Opening End Time")
                {
                    ApplicationArea = Basic;
                    Editable = rec."Is Refloated";
                    Caption = 'Bid Submission End Time';
                    ToolTip = 'Specifies the value of the Bid Opening End Time field.';
                }
                field("Bid Opening Date"; Rec."Bid Opening Date")
                {
                    ApplicationArea = Basic;
                    Editable = rec."Is Refloated";
                    ToolTip = 'Specifies the value of the Bid Opening Date field.';
                }
                field("Bid Opening Start Time"; Rec."Bid Opening Start Time")
                {
                    ApplicationArea = Basic;
                    Editable = rec."Is Refloated";
                    ToolTip = 'Specifies the value of the Bid Opening Start Time field.';
                }

                field("Bid Opening Venue"; Rec."Bid Opening Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Opening Venue field.';
                }
                field(Chairperson; Rec."Opening Person 1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Chairperson';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Person 1 field.';
                }
                field("Member One"; Rec."Opening Person 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member One';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Person 2 field.';
                }
                field("Member Two"; Rec."Opening Person 3")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Two';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Person 3 field.';
                }
                field("Member Three"; Rec."Opening Person 4")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Three';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Person 4 field.';
                }
                field("Member Four"; Rec."Opening Person 5")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Four';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Person 5 field.';
                }

                field("Pre-bid Purchaser Code"; Rec."Pre-bid Purchaser Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Procurement Officer';
                    ToolTip = 'Specifies the value of the Lead Procurement Officer field.';
                }
                field("Supply Chain Officer Name"; Rec."Supply Chain Officer Name")
                {
                    ApplicationArea = all;
                }
                field("Tender Evaluation Deadline"; Rec."Tender Evaluation Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Evaluation Deadline field.';
                }
                field("No. of Intention To Bid Vendor"; Rec."No. of Intention To Bid Vendor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Intention To Bid Vendor field.';
                }
                field("No. of Submitted Bids"; Rec."No. of Submitted Bids")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Submitted Bids field.';
                }
                // field("Required Bid Security Amount"; Rec."Required Bid Security Amount")
                // {
                //     ApplicationArea = Basic;

                //     ToolTip = 'Specifies the value of the Required Bid Security Amount (LCY) field.';
                // }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = all;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date"; Rec."Created Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
                field("Is Refloated"; Rec."Is Refloated")
                {
                    ApplicationArea = all;
                    Caption = 'Is Refloated?';
                    // Editable = false;
                    ToolTip = 'Specifies the value if the bid is refloated';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
            }
            part(Control28; "Bid Opening Register Line")
            {
                SubPageLink = Code = field(Code);
                // SubPageView = sorting("Bid Number") order(ascending);
                ApplicationArea = Basic;
            }
            part(Control31; "IFS Intention To Bid")
            {
                Caption = 'Invited Bidders';
                Visible = Rec."Is Refloated";
                // Editable = Recorec;
                SubPageLink = Code = field("IFS Code"), Category = field("Procurement Category");
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(ActionGroup30)
            {
                action("Attendance Register")
                {
                    ApplicationArea = Basic;
                    Image = AllocatedCapacity;
                    RunObject = Page "Bid Opening Bidder Attendance";
                    RunPageLink = Code = field(upperlimit(Code)),
                                  "IFS Code" = field("IFS Code");
                    ToolTip = 'Executes the Attendance Register action.';
                }

                
                action("Bid Opening Tender Committee")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    RunObject = Page "Bid Opening Tender Committee";
                    RunPageLink = "Document No." = field(Code);
                    ToolTip = 'Executes the Bid Opening Tender Committee action.';
                }

                action("Send Bid Opening Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Bid Opening Codes';
                    Image = OpenJournal;
                    ToolTip = 'Executes the Send Bid Opening Codes action.';
                    trigger OnAction()
                    begin
                        Procurement.FnSendSecretCodeOnIFSBidOpening(Rec)
                    end;
                }
                action("Unseal Bid")
                {
                    ApplicationArea = Basic;
                    Image = OpenWorksheet;
                    ToolTip = 'Executes the Unseal Bid action.';
                    trigger OnAction()
                    begin
                        Procurement.UnsealBid(Rec);
                    end;
                }
                action("Close and Refloat")
                {
                    ApplicationArea = all;
                    Image = CloseDocument;
                    ToolTip = 'Excutes the Close and Refloats the Bid Process';
                    trigger OnAction()
                    var
                        myInt: Integer;
                        Bids: Record "Standard Purchase Code";
                        InvitedBidders: Record "Standard Vendor Purchase Code";
                        TenderCommetee: Record "Bid Opening Tender Committee";

                    begin
                        rec.TestField("Approval Status", rec."Approval Status"::Released);
                        rec.TestField("Is Refloated", true);
                        if Confirm('Do you want to close and Refloat this RFQ process?') then begin
                            InvitedBidders.Reset();
                            InvitedBidders.SetRange(Code, Rec."IFS Code");
                            if InvitedBidders.FindSet() then
                                if InvitedBidders.Count < 1 then
                                    Error('Invited Bidders Must be greater than Zero in lines');
                            rec."Is Refloated" := true;
                            rec."Refloated By" := UserId;
                            TenderCommetee.Reset();
                            TenderCommetee.SetRange("Document No.", Rec.Code);
                            if TenderCommetee.FindFirst() then begin
                                repeat
                                    TenderCommetee."Member Code" := '';
                                    TenderCommetee.Modify();
                                until TenderCommetee.Next() = 0;
                            end;
                            rec.Modify();
                            Bids.Reset();
                            Bids.SetRange(Bids.Code, Rec."IFS Code");
                            if Bids.FindFirst() then begin
                                Bids."Submission End Date" := Rec."Bid Opening End Date";
                                Bids."Submission End Time" := rec."Bid Opening End Time";
                                Bids."Bid Opening Date" := rec."Bid Opening Date";
                                Bids."Bid Opening Time" := rec."Bid Opening Start Time";
                                Bids.Modify();
                            end;
                            Message('Closed and refloated');
                            CurrPage.Close();
                        end;
                    end;

                }
                action("Tender Opening Minutes")
                {
                    ApplicationArea = Basic;
                    Image = WIPEntries;
                    RunObject = Page "Tender Opening Summary Note";
                    RunPageLink = "Register ID" = field(Code);
                    ToolTip = 'Executes the Tender Opening Minutes action.';
                }
                action(Print)
                {
                    ApplicationArea = Basic;
                    Image = PrintAttachment;
                    ToolTip = 'Executes the Print action.';
                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(Code, Rec.Code);
                        Report.Run(70040, true, true, Rec);
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostDocument;
                    ToolTip = 'Executes the Post action.';
                    trigger OnAction()
                    begin
                        if rec."Is Refloated" = false then begin
                            Procurement.PostBidOpeningRegister(Rec);
                            Rec.Posted := true;
                            Rec."Posted By" := UserId;
                            Rec."Posted Date" := Today;
                            Rec.Modify();
                        end
                        else
                            if rec."Is Refloated" = true then begin
                                rec.TestField("Approval Status", rec."Approval Status"::Released);
                                Procurement.PostBidOpeningRegister(Rec)
                            end;
                    end;
                }
                action("Send Approval")
                {
                    ApplicationArea = all;
                    Image = SendApprovalRequest;
                    Enabled = rec."Is Refloated";
                    ToolTip = 'Executes the Send Approval action.';

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    end;
                }
                action("Cancell Approval")
                {
                    ApplicationArea = all;
                    Image = Cancel;
                    Enabled = rec."Is Refloated";
                    ToolTip = 'Executes the Cancell Approval action.';
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }
                action("Approvals")
                {
                    ApplicationArea = all;
                    Image = Approvals;
                    Enabled = rec."Is Refloated";
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        VarVariant := Rec;
                        ApprovalsMgmt.OpenApprovalEntriesPage(rec.RecordId);
                    end;
                }
                
            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 1.';
            }
            group(Category_Report)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Bid Process', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Close and Refloat_Promoted"; "Close and Refloat")
                {
                }
                actionref("Attendance Register_Promoted"; "Attendance Register")
                {
                }
                actionref("Bid Opening Tender Committee_Promoted"; "Bid Opening Tender Committee")
                {
                }
                actionref("Send Bid Opening Codes_Promoted"; "Send Bid Opening Codes")
                {
                }
                actionref("Unseal Bid_Promoted"; "Unseal Bid")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Workflow Process', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref("Send Approval_Promoted"; "Send Approval")
                {
                }
                actionref("Cancell Approval_Promoted"; "Cancell Approval")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Category6)
            {
                Caption = 'Reports', Comment = 'Generated from the PromotedActionCategories property index 5.';

                actionref("Tender Opening Minutes_Promoted"; "Tender Opening Minutes")
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }
    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        if rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

    end;

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        if rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

    end;

    trigger OnAfterGetCurrRecord()
    var
        myInt: Integer;
    begin

        if rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false
        else
            CurrPage.Editable := true;

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Technical
    end;

    var
        Procurement: Codeunit "Procurement Processing";
        Text001: label 'Do you want to post?';
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        OpenApprovalEntriesExistCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        CanCancelApprovalForRecord: Boolean;
        CanRequestApprovalForFlow: Boolean;
        CanCancelApprovalForFlow: Boolean;
        ShowWorkflowStatus: Boolean;
        VarVariant: Variant;
}

#pragma implicitwith restore

