page 52193639 "Payroll Data Form List"
{
    ApplicationArea = All;
    Caption = 'Payroll Data Form List';
    PageType = List;
    SourceTable = "prBasic pay PCA";
    UsageCategory = Lists;
    CardPageId = "Payroll Data Form";
    SourceTableView = where("Document Type" = filter("Payroll Data"));


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Change Advice Serial No."; Rec."Change Advice Serial No.")
                {
                    Caption = 'No';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Change Advice Serial No. field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Implementing Unit"; Rec."Implementing Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Implementing Unit field.';
                }
                field("Final Approver Status"; Rec."Final Approver Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Final Approver Status field.';
                }
                field("Open Approver Count"; Rec."Open Approver Count")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Open Approver Count field.';
                }
                field("Final Approver Seq No"; Rec."Final Approver Seq No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Final Approver Seq No field.';
                }
            }
        }

    }
    actions
    {
        area(processing)
        {
            action("Refresh Approvals")

            {

                Image = Approvals;
                ApplicationArea = Basic;
                trigger OnAction()
                var
                    ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    ApprovalEntryArgument: Record "Approval Entry";
                    PCAHeader: Record "prBasic pay PCA";
                begin
                    // PCAHeader.Reset();
                    // PCAHeader.Setfilter(Status, '<>%1', PCAHeader.Status::Open);
                    // if PCAHeader.find('-') then begin
                    //     repeat
                    //         ApprovalEntryArgument.Reset();
                    //         ApprovalEntryArgument.Setrange("Document No.", PCAHeader."Change Advice Serial No.");
                    //         ApprovalEntryArgument.Setrange("Employee No.", '');
                    //         if ApprovalEntryArgument.Find('-') then begin
                    //             repeat
                    //                 ApprovalEntryArgument.Validate("Employee No.", PCAHeader."Employee Code");
                    //                 ApprovalEntryArgument.Modify(false);
                    //             until ApprovalEntryArgument.Next() = 0;
                    //         end;

                    //     until PCAHeader.Next() = 0;
                    // end;                


                    Validate(Status);
                    modify;

                    Message('Successful');
                end;

            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("Refresh Approvals_Promoted"; "Refresh Approvals")
                {
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.SetFilter(Rec."User ID", UserId);
    end;

}
