namespace ALProjectLIWPA.ALProjectLIWPA;


page 50034 "Lookup EFT Lines"
{
    PageType = List;
    UsageCategory = None;
    SourceTable = "PV Lines";
    SourceTableTemporary = true;
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Select; Select)
                {
                    ApplicationArea = All;
                }
                field("Account Type"; "Account Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Account No"; "Account No")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Posted Date"; "Posted Date")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Shortcut Dimension 1 Code"; "Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payment Mode1"; "Payment Mode1")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Gross Amount"; Rec."Amount (LCY)")
                {
                    Caption = 'Gross Amount';
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("VAT Amount"; "VAT Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("W/T VAT Amount"; "W/T VAT Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("W/Tax Amount"; "W/Tax Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Retention  Amount"; "Retention  Amount")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    Caption = 'Net Amount';
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payee Bank Code"; "Payee Bank Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payee Bank Name"; "Payee Bank Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payee Bank Branch Code"; "Payee Bank Branch Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payee Bank Branch Name"; "Payee Bank Branch Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payee Bank Account No."; "Payee Bank Account No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payee Bank Acc Name"; "Payee Bank Acc Name")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Source Document Type"; "Source Document Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Source Document No."; "Source Document No.")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Select All")
            {
                ApplicationArea = Basic, Suite;
                Image = SelectMore;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure to Select All?', false) then begin
                        Rec.Reset;
                        if Rec.FIndSet() then begin
                            repeat
                                ValidateBankDetailsOnSelect(Rec);
                                Rec.Select := true;
                                Rec.Modify();
                            until Rec.Next = 0;
                        end;
                    end;

                end;
            }

            action("Clear Selection")
            {
                ApplicationArea = Basic, Suite;
                Image = CancelAllLines;
                Promoted = true;
                PromotedIsBig = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    if Confirm('Are you sure to Clear Selection For All?', false) then begin
                        Rec.Reset;
                        if Rec.FIndSet() then
                            Rec.ModifyAll(Select, false);
                    end;
                end;
            }

        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
    end;

    var
        PVLines, PVLines2 : Record "PV Lines" temporary;
        EFTHeader: Record "EFT Header";


    procedure SetEFTHeader(EFT: Record "EFT Header")
    begin
        EFTHeader := EFT;
    end;

    procedure SetLines(var EFTLines: Record "PV Lines")
    begin
        if EFTLines.FindSet() then
            repeat
                Rec.Init();
                Rec.TransferFields(EFTLines);
                Rec.Insert();

            until EFTLines.Next() = 0;
    end;

    procedure GetLines(var EFTLines: Record "PV Lines")
    begin
        Rec.Reset();
        Rec.SetRange(Select, true);
        if Rec.FindSet() then begin
            repeat
                EFTLines.Init();
                EFTLines.TransferFields(Rec);
                EFTLines.Insert();
                ValidateBankDetailsOnSelect(Rec)
            until Rec.Next() = 0;
        end;
    end;

    local procedure ValidateBankDetailsOnSelect(var PVLines: Record "PV Lines" temporary)
    begin
        if PVLines.Select then begin
            if (PVLines."Payee Bank Code" = '') or (PVLines."Payee Bank Branch Code" = '') or (PVLines."Payee Bank Account No." = '') then
                Error('You can only select payments with all bank details, Bank Code, Bank Branch Code and Account No. provided');
        end;
    end;
}