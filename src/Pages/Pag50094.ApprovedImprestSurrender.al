 
   page 50094 "Approved Imprest Surrenders"
{
    CardPageID = "Approved Imprest Surrender";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Surrender),
                            Status = filter(Released),
                            Posted = const(false),
                            Surrendered = const(false));

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
                    ToolTip = 'Specifies the value of the No. field.';
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                    Editable = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll No.';
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                    Editable = false;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                    Editable = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                    Editable = false;
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                    Editable = false;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                    Editable = false;
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Post Batch")
            {
                ApplicationArea = Basic, Suite;
                Image = PostBatch;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                var
                    Window: Dialog;
                    ProgressTxt: Label 'Processing Lines \ ##1## of ##2##';
                    Payments: Record Payments;
                    PaymentsPost: Codeunit "Payments-Post";
                    TotalCounter, Counter : Integer;
                begin
                    Payments.Reset();
                    Payments.SetRange("Payment Type", Payments."Payment Type"::Surrender);
                    Payments.SetRange(Posted, false);
                    Payments.SetRange(Select, true);
                    if Payments.FindSet() then begin
                        if not Confirm('Are you sure to Post Selected Lines', false) then
                            exit;
                        TotalCounter := Payments.Count;
                        Window.Open(ProgressTxt);
                        Window.Update(2, TotalCounter);
                        repeat
                            Counter += 1;
                            Window.Update(1, Counter);
                            PaymentsPost."Post ImprestSurrender"(Rec, true);
                            Commit();
                        until Payments.Next() = 0;
                        Window.Close();
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(57002, true, true);
                    Rec.Reset;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;


}


