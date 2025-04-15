namespace ALProjectLIWPA.ALProjectLIWPA;
using Microsoft.Finance.GeneralLedger.Account;


page 50066 "Standing Imprest Lines"
{
    PageType = ListPart;
    SourceTable = "PV Lines";
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ValuesAllowed = Employee, Customer;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer To';
                    ShowMandatory = true;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Vote Item"; "Vote Item")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Code"; "Payee Bank Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Name"; "Payee Bank Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Branch Code"; "Payee Bank Branch Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Payee Bank Branch Name"; "Payee Bank Branch Name")
                {
                    ApplicationArea = Basic, Suite;
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
                field(rbankName; Rec.rbankName)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Validated Bank Name';
                    Editable = false;


                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group("Update")
            {
                action("Update Economic Item")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Economic Item';
                    Image = Action;
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    var
                        econItem: Code[20];
                        GlAccount: Record "G/L Account";
                        ChartOfAccounts: Integer;
                    begin
                        ChartOfAccounts := 16;
                        if Page.RunModal(ChartOfAccounts, GlAccount) = ACTION::LookupOK then begin
                            econItem := GlAccount."No.";
                            Rec."Vote Item" := econItem;
                            Rec.Modify();
                            Message('You selected account: %1 - %2', GlAccount."No.", GlAccount.Name);
                        end;
                    end;
                }
            }
        }

    }



}
