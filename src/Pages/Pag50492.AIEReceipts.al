page 50492 "AIE Receipts"
{
    Caption = 'AIE Receipts';
    CardPageID = "AIE Receipts";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Receipts Header1";
    SourceTableView = where("Receipt Type" = const(AIE));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Select)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted Time"; Rec."Posted Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                    Caption = 'Geographical Name';

                }

                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Project Name field.', Comment = '%';
                    Caption = 'Admin Unit Name';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(PostBatch)
            {
                ApplicationArea = Basic, Suite;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    ProgressTxt: Label 'Procesing ##1## of ##2###';
                    Window: Dialog;
                    // PayPost: Codeunit "Payments-Post";
                    TotalCounter, Counter : Integer;
                begin
                    Receipts.Reset();
                    Receipts.SetRange(Status, Receipts.Status::Released);
                    Receipts.SetRange(Posted, false);
                    Receipts.SetRange("Receipt Type", Receipts."Receipt Type"::Normal);
                    Receipts.SetRange(Select, true);
                    Receipts.SetRange("Direct Income Voucher", false);
                    if Receipts.FindSet() then begin
                        if not Confirm('Are you sure to Post Selected Lines', false) then
                            exit;
                        TotalCounter := Receipts.Count;
                        Window.Open(ProgressTxt);
                        Window.Update(2, TotalCounter);
                        repeat
                            Counter += 1;
                            Window.Update(1, Counter);
                            // PayPost.PostReceipt(Receipts, true);
                            Commit();
                        until Receipts.Next() = 0;
                        Window.Close();
                    end;
                end;
            }
        }
    }

    trigger OnOpenPage()
    var
        TXT001: label 'You do not have sufficient rights to view the receipts page,consult the system administrator';
    begin
        Rec.SetRange(Cashier, UserId);
        UserSetup.Reset;
        UserSetup.SetRange("Finance Dept.", true);
        UserSetup.SetRange("User ID", UserId);
        if not UserSetup.FindFirst then begin
            Error(TXT001);
        end;

        //Reset Selected
        Receipts.Reset();
        Receipts.SetRange(Posted, false);
        Receipts.SetRange("Receipt Type", Receipts."Receipt Type"::Normal);
        Receipts.SetRange(Select, true);
        Receipts.SetRange("Direct Income Voucher", false);
        if Receipts.FindSet() then
            Receipts.ModifyAll(Select, false);

        Commit();
    end;

    var
        UserSetup: Record "User Setup";
        Receipts: Record "Receipts Header1";
}
