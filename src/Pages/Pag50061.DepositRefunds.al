namespace ALProjectLIWPA.ALProjectLIWPA;

page 50061 "Deposit Refund Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";
    // ModifyAllowed = false;
    // Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;


                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;

                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;


                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Editable = false;


                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                }
                field("Applies-to Doc. Type"; Rec."Applies-to Doc. Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Applies to Doc. No"; Rec."Applies to Doc. No")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;


                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Payee Bank Name"; Rec."Payee Bank Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Name field.', Comment = '%';
                    Editable = Rec."Bounced PV Type" = Rec."Bounced PV Type"::Refund;

                }
                field("Payee Bank"; Rec."Payee Bank Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank field.', Comment = '%';
                    Editable = Rec."Bounced PV Type" = Rec."Bounced PV Type"::Refund;

                }
                field("Payee Branch Code"; Rec."Payee Bank Branch Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Branch Code field.', Comment = '%';
                    Editable = Rec."Bounced PV Type" = Rec."Bounced PV Type"::Refund;
                }

                field("Payee Bank Acc Name"; Rec."Payee Bank Acc Name")
                {
                    ApplicationArea = All;

                    Editable = Rec."Bounced PV Type" = Rec."Bounced PV Type"::Refund;

                }
                field("Payee Bank Acc"; Rec."Payee Bank Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Acc field.', Comment = '%';
                    Editable = Rec."Bounced PV Type" = Rec."Bounced PV Type"::Refund;
                }

                field("Amount To Utilize"; Rec."Amount To Utilize")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Editable = false;

                }
                field("Amount To Refund"; Rec."Amount To Refund")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;

                }
                field("Net Amount"; Rec."Net Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("VAT Rate"; Rec."VAT Rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("VAT Six % Rate"; Rec."VAT Six % Rate")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("VAT Withheld Amount"; Rec."VAT Withheld Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Visible = false;

                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Actual to Date"; Rec."Actual to Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Budgetary Control A/C"; Rec."Budgetary Control A/C")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Retention  Amount"; Rec."Retention  Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Claim Doc No."; Rec."Claim Doc No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("W/Tax Code"; Rec."W/Tax Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("W/T VAT Code"; Rec."W/T VAT Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("VAT Amount"; Rec."VAT Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("W/Tax Amount"; Rec."W/Tax Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnLookup(var Text: Text): Boolean
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;
                    Visible = false;

                    trigger OnValidate()
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;

                }
                field("Payee Account Type"; "Payee Account Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Payee Account No."; "Payee Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
                field("Payee Account Name"; "Payee Account Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Additional Info.")
            {
                action(DocAttach)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category5;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        // DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                        RecRef2: RecordRef;
                    // PurchInvHeader: Record "Purch. Inv. Header";
                    begin
                        // if PurchInvHeader.Get(Rec."Applies to Doc. No") then begin
                        //     RecRef.GetTable(PurchInvHeader);
                        //     DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        //     DocumentAttachmentDetails.RunModal;
                        // end;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        DepositH: Record Payments;
        AmountToRefundEditablle: Boolean;
    begin
        //     DepositH.Reset();
        //     DepositH.SetRange("No.", Rec.No);
        //     if DepositH.FindSet() then begin
        //         if DepositH."Refund Policy" = DepositH."Refund Policy"::Forfeiture then begin
        //             Rec."Amount To Refund" := Rec.Amount;
        //         end;
        //         if DepositH."Refund Policy" = DepositH."Refund Policy"::"Full Utlization" then begin
        //             Rec."Amount To Utilize" := Rec.Amount;
        //         end;

        //         if DepositH."Refund Policy" = DepositH."Refund Policy"::"Partial Utilizarion" then begin

        //         end;
        //     end;
        DepositH.Reset();
        DepositH.SetRange("No.", Rec.No);
        if DepositH.FindFirst() then begin
            if DepositH.Status <> DepositH.Status::Open then
                CurrPage.Editable := false;
        end;
    end;
}


