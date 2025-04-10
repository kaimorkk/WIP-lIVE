Page 52194260 "GS Store Requisitions List"
{
    ApplicationArea = Basic;
    CardPageID = "Store Requisition Header GS";
    PageType = List;
    SourceTable = "Requisition Header1";
    SourceTableView = where("Requisition Type" = const("Store Requisition"));
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

    trigger OnOpenPage()
    begin
        //MESSAGE('USER %1',USERID);
        if UserSetup.Get(UserId) then begin
            //  FILTERGROUP(2);
            // Filterstring := GETFILTERS;
            //  FILTERGROUP(0);
            // IF STRLEN(Filterstring) = 0 THEN BEGIN
            //   FILTERGROUP(2);
            SetRange("Raised by", UserSetup."User ID");
            //  FILTERGROUP(0);
            //  END
        end;
        //SETRANGE("Raised by",SID);
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        Trash: Record "Requisition Header1";
        Filterstring: Text[250];
}

