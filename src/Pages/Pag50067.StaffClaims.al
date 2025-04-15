namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Security.User;


page 50067 "Staff Claims"
{
    CardPageID = "Staff Claim";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const("Staff Claim"), "Document Type" = filter(<> "Bounced Payment Voucher"));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000019; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000020; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Petty Cash Voucher")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57003, true, true, Rec);
                    Rec.SetRange("No.");
                end;
            }
            action("Refresh Payments")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;

                trigger OnAction()
                var
                    PayH: Record Payments;
                    ExpReq: Record "Expense Requisition";
                begin
                    PayH.Reset();
                    PayH.SetRange(Status, PayH.Status::"Pending Approval");
                    if PayH.Find('-') then begin
                        repeat
                            PayH.Validate("Responsibility Center");
                            PayH.Modify();
                        until PayH.Next() = 0;
                    end;
                    ExpReq.Reset();
                    ExpReq.SetRange(ExpReq."Approval Status", ExpReq."Approval Status"::"Pending Approval");
                    if ExpReq.find('-') then begin
                        Repeat
                        // ExpReq.CalcFields("Final Approver Status");
                        // ExpReq.CalcFields("Open Approver Count");
                        // ExpReq.CalcFields("Cancelled Approver Count");
                        // if (ExpReq."Final Approver Status" = ExpReq."Final Approver Status"::Approved) and (ExpReq."Open Approver Count" = 0) then begin
                        //     ExpReq."Approval Status" := ExpReq."Approval Status"::Released;
                        //     ExpReq.modify();
                        // end;
                        until ExpReq.Next = 0;
                    end;
                    Message('All Payments refreshed successfully');

                end;
            }
        }
    }


    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Staff Claims";
    end;

    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";

    begin
        if UserSetup.Get(UserId) then begin
            // if UserSetup."Station Accountant" = true then begin
            //     Rec.FilterGroup(2);
            //     Rec.SetRange(rec."Shortcut Dimension 1 Code", UserSetup."Global Dimension 1 Code");
            //     Rec.FilterGroup(0)
            // end;
            // if (UserSetup."Station Accountant" = false) and (UserSetup."HQ Accountant" = false) then begin
            //     Rec.FilterGroup(2);
            //     Rec.SetRange(rec."Created By", UserSetup."User ID");
            //     Rec.FilterGroup(0)
            // end;
        end;
        //SETRANGE("Created By",USERID);
    end;
}

#pragma implicitwith restore

