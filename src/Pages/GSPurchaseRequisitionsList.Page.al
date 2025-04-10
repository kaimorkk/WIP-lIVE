Page 52194259 "GS Purchase Requisitions List"
{
    ApplicationArea = Basic;
    CardPageID = "Requisition Header";
    PageType = List;
    SourceTable = "Requisition Header1";
    SourceTableView = where("Requisition Type" = const("Purchase Requisition"),
                            Posted = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeCode; "Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Reason; Reason)
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionDate; "Requisition Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Raisedby; "Raised by")
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries; "No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Purchase; "Purchase?")
                {
                    ApplicationArea = Basic;
                }
                field(MAApproval; "MA Approval")
                {
                    ApplicationArea = Basic;
                }
                field(Rejected; Rejected)
                {
                    ApplicationArea = Basic;
                }
                field(ProcessType; "Process Type")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Ordered; Ordered)
                {
                    ApplicationArea = Basic;
                }
                field(User; User)
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension3Code; "Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlan; "Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field(PurchaserCode; "Purchaser Code")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentType; "Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(DateofUse; "Date of Use")
                {
                    ApplicationArea = Basic;
                }
                field(RequisitionType; "Requisition Type")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                }
                field(NoofApprovals; "No of Approvals")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Requisition Type" := "requisition type"::MemberApplication;
    end;

    trigger OnOpenPage()
    begin
        //MESSAGE('USER %1',USERID);
        SetRange("Raised by", UserId);
        //SETRANGE("Raised by",SID);
        /*
          IF UserSetup.GET(USERID) THEN
          BEGIN

          IF UserSetup."Approver ID"=USERID THEN
          SETRANGE("Raised by");
          ApprovalTemplate.RESET;
          ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Requisition Header1");
          ApprovalTemplate.SETRANGE(ApprovalTemplate."Document Type","Requisition Type");
          ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
          IF ApprovalTemplate.FIND('-') THEN
          BEGIN
          AdditionalApprovers.RESET;
          AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
          AdditionalApprovers.SETRANGE(AdditionalApprovers."Document Type","Requisition Type");
          AdditionalApprovers.SETRANGE(AdditionalApprovers."Approver ID",USERID);
          IF AdditionalApprovers.FIND('+') THEN
          SETRANGE("Raised by");
          END;
          IF ApprovalSetup.GET THEN
          IF ApprovalSetup."Approval Administrator"=USERID THEN
          SETRANGE("Raised by");


          ApprovalTemplate.RESET;
          ApprovalTemplate.SETRANGE(ApprovalTemplate."Table ID",DATABASE::"Requisition Header1");
          ApprovalTemplate.SETRANGE(ApprovalTemplate."Document Type","Requisition Type");
          ApprovalTemplate.SETRANGE(ApprovalTemplate.Enabled,TRUE);
          IF ApprovalTemplate.FIND('-') THEN
          BEGIN
          AdditionalApprovers.RESET;
          AdditionalApprovers.SETRANGE(AdditionalApprovers."Approval Code",ApprovalTemplate."Approval Code");
          AdditionalApprovers.SETRANGE(AdditionalApprovers."Document Type","Requisition Type");
          IF AdditionalApprovers.FIND('-') THEN
          REPEAT

           UserSetupRec.RESET;
           UserSetupRec.SETRANGE(UserSetupRec.Substitute,AdditionalApprovers."Approver ID");
           IF UserSetupRec.FIND('-') THEN
           SETRANGE("Raised by");
          UNTIL AdditionalApprovers.NEXT=0;

          END;




          END;
       */

    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        Trash: Record "Requisition Header1";
}

