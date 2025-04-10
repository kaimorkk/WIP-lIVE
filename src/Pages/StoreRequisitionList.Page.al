Page 52194225 "Store Requisition List"
{
    CardPageID = "Store Requisition Header";
    PageType = List;
    SourceTable = "Requisition Header1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                Editable = false;
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

        SetRange("Raised by", UserId);

        // if UserSetup.Get(UserId) then begin

        //     if UserSetup."Approver ID" = UserId then
        //         SetRange("Raised by");
        //     ApprovalTemplate.Reset;
        //     ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::Table59018);
        //     ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
        //     if ApprovalTemplate.Find('-') then begin
        //         AdditionalApprovers.Reset;
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approver ID", UserId);
        //         if AdditionalApprovers.Find('+') then
        //             SetRange("Raised by");
        //     end;
        //     if ApprovalSetup.Get then
        //         if ApprovalSetup."Approval Administrator" = UserId then
        //             SetRange("Raised by");


        //     ApprovalTemplate.Reset;
        //     ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::Table59018);
        //     ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
        //     if ApprovalTemplate.Find('-') then begin
        //         AdditionalApprovers.Reset;
        //         AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
        //         if AdditionalApprovers.Find('-') then
        //             repeat

        //                 UserSetupRec.Reset;
        //                 UserSetupRec.SetRange(UserSetupRec.Substitute, AdditionalApprovers."Approver ID");
        //                 if UserSetupRec.Find('-') then
        //                     SetRange("Raised by");
        //             until AdditionalApprovers.Next = 0;

        //     end;




        // end;
    end;

    var
        ApprovalMgt: Codeunit "Approvals Mgmt.";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        UserSetupRec: Record "User Setup";
        Users: Record "User Setup";
}

