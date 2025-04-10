Page 52193892 "Store Requisition Line"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Requisition Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(LineNo; "Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
                }
                field(UnitofMeasure; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                // field(UnitPrice; "Unit Price")
                // {
                //     ApplicationArea = Basic;
                // }
                field(QuantityinStore; "Quantity in Store")
                {
                    ApplicationArea = Basic;
                }
                field(QuantityApproved; "Quantity Approved")
                {
                    ApplicationArea = Basic;
                    Editable = "Quantity ApprovedEditable";
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(ProcurementPlan; "Procurement Plan")
                {
                    ApplicationArea = Basic;
                }
                field(BudgetLine; "Budget Line")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        QuantityinStoreOnFormat;
    end;

    trigger OnInit()
    begin
        "Quantity ApprovedEditable" := true;
    end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     // MESSAGE(USERID);
    //     Requisition.SetRange(Requisition."No.", "Requisition No");

    //     // ApprovalTemplate.Reset;
    //     // ApprovalTemplate.SetRange(ApprovalTemplate."Table ID", Database::"Requisition Header1");
    //     // ApprovalTemplate.SetRange(ApprovalTemplate.Enabled, true);
    //     // if ApprovalTemplate.Find('+') then begin
    //     //     AdditionalApprovers.Reset;
    //     //     AdditionalApprovers.SetRange(AdditionalApprovers."Approval Code", ApprovalTemplate."Approval Code");
    //     //     if AdditionalApprovers.Find('+') then
    //     //         CurrentUser := AdditionalApprovers."Approver ID";

    //     end;


    //     /* IF Requisition.Status<>Requisition.Status::Open THEN BEGIN
    //      //MESSAGE(CurrentUser,USERID);
    //      IF  UPPERCASE(USERID)<>CurrentUser THEN
    //       ERROR('You cannot make changes at this stage');
    //       END;*/

    // end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::Item;
    end;

    var
        Requisition: Record "Requisition Header1";
        user: Record "User Setup";
        ApprovalEntry: Record "Approval Entry";
        UserSetup: Record "User Setup";
        // ApprovalTemplate: Record "Approval Templates";
        // AdditionalApprovers: Record "Additional Approvers";
        // ApprovalSetup: Record "Approval Setup";
        CurrentUser: Code[20];

        "Quantity ApprovedEditable": Boolean;

    local procedure QuantityinStoreOnFormat()
    begin
        if Requisition.Get("Requisition No") then begin
            if Requisition."Raised by" = UserId then
                "Quantity ApprovedEditable" := true;
        end;
    end;
}

