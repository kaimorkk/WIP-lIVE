

page 59026 "Fuel Requisition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Fuel & Maintenance Requisition";
    SourceTableView = where(Type = filter(Fuel));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Requisition No"; Rec."Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requisition No field.';
                }
                field("Total Price of Fuel"; Rec."Total Price of Fuel")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount Requested';
                    Editable = TotalAmountEditable;
                    ToolTip = 'Specifies the value of the Total Amount Requested field.';
                }
                field("Transport Requisition No."; Rec."Transport Requisition No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Requisition No. field.';
                    LookupPageId = "Closed Fleet Requests List";
                }
                field("Route Code"; Rec."Route Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Code field.';
                }
                field("Route Description"; Rec."Route Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Route Description field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = RequestDateEditable;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Prepared By"; Rec."Prepared By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Prepared By field.';
                }
                field("Posted Invoice No"; Rec."Posted Invoice No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Invoice No';
                    Editable = chequeEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted Invoice No field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Editable = TotalAmountEditable;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Job Task"; Rec."Job Task")
                {
                    ApplicationArea = Basic;
                    Editable = TotalAmountEditable;
                    ToolTip = 'Specifies the value of the Job Task field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal();
                end;
            }
        }

        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";

                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin

                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                end;
            }

            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin

                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            action("Post Fuel Requisition Claim")
            {
                ApplicationArea = Basic;
                Image = RegisteredDocs;
                ToolTip = 'Executes the Submit Fuel Requisition Claim action.';
                trigger OnAction()
                begin
                    //TESTFIELD("Posted Invoice No");

                    if Confirm('Are you sure you want to close this Fuel Request?', true) then begin
                        FleetSetup.Get;
                        InterProjHeader.Init;
                        InterProjHeader."Document Date" := Today;
                        InterProjHeader."Posting Description" := 'FUEL REIMBUSIBLE ' + Rec."Requisition No";
                        InterProjHeader."External Document No." := Rec."Requisition No";
                        InterProjHeader."Created By" := UserId;
                        InterProjHeader."Created On" := Today;
                        InterProjHeader."Transfer-To Job No" := FleetSetup."Transfer-To Job No";
                        InterProjHeader."Transfer-To Task No" := FleetSetup."Transfer-To Task No";
                        InterProjHeader."Transfer-To Income G/L A/C" := FleetSetup."Transfer-To Income G/L A/C";
                        InterProjHeader."Main Funds Bank A/C" := FleetSetup."Main Funds Bank A/C";
                        if InterProjHeader.Insert(true) then begin
                            InterProjLine.Init;
                            InterProjLine."Document No" := InterProjHeader.No;
                            InterProjLine."Transfer-From Job No" := Rec."Job No";
                            InterProjLine.Validate("Transfer-From Job No");
                            InterProjLine."Transfer-From Task No" := Rec."Job Task";
                            InterProjLine.Validate("Transfer-From Task No");
                            InterProjLine."Transfer Line Amount" := Rec."Total Price of Fuel";
                            InterProjLine."Transfer Line Amount LCY" := Rec."Total Price of Fuel";
                            InterProjLine.Insert(true);
                            Rec.Status := Rec.Status::Closed;
                            Rec."Closed By" := UserId;
                            Rec."Date Closed" := Today;
                            Rec.Modify(true);
                        end;
                        if Confirm('%1 Created, would you like to preview?', true, InterProjHeader.No) then
                            Page.Run(65144, InterProjHeader);

                        CurrPage.Close;
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'Home', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref("Post Fuel Requisition Claim_Promoted"; "Post Fuel Requisition Claim")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Document', Comment = 'Generated from the PromotedActionCategories property index 4.';

                actionref(Attachments_Promoted; Attachments)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec.Type := Rec.Type::Fuel;
        Rec."Request Date" := Today;
        Rec.Status := Rec.Status::Open;
        //IF FltUserSetup.GET(USERID) THEN BEGIN
        //FltUserSetup.TESTFIELD("User Department");
        Rec."Prepared By" := UserId;
        //Department:=FltUserSetup."User Department";
        //END ELSE
        //ERROR(Text0001);
    end;

    var
        VendorEditable: Boolean;
        TotalAmountEditable: Boolean;
        RequestDateEditable: Boolean;
        chequeEditable: Boolean;
        InterProjHeader: Record "Inter_Project Transfer Header";
        InterProjLine: Record "Inter-Project Transfer Line";
        FleetSetup: Record "Fleet Management Setup";


    procedure updatecontrols()
    begin
        if Rec.Status = Rec.Status::Open then begin
            VendorEditable := true;
            TotalAmountEditable := true;
            RequestDateEditable := false;
            chequeEditable := false;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                VendorEditable := false;
                TotalAmountEditable := false;
                RequestDateEditable := false;
                chequeEditable := false;

            end else
                if Rec.Status = Rec.Status::Approved then begin
                    VendorEditable := false;
                    TotalAmountEditable := false;
                    RequestDateEditable := false;
                    chequeEditable := true;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        VendorEditable := false;
                        TotalAmountEditable := false;
                        RequestDateEditable := false;
                        chequeEditable := false;

                    end
    end;
}

#pragma implicitwith restore

