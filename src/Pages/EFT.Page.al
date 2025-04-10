Page 52193755 EFT
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = EFT1;
    SourceTableView = where("EFT Generated"=const(false));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Selected;Selected)
                {
                    ApplicationArea = Basic;
                }
                field(DocumentNo;"Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(PostingDate;"Posting Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(PayeeName;PayeeName)
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(BankCode;"Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(BranchCode;"Branch Code")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccountNumber;"Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(EFT)
            {
                Caption = 'EFT';
                action(UploadData)
                {
                    ApplicationArea = Basic;
                    Caption = 'Upload Data';

                    trigger OnAction()
                    begin
                           EFTGenerate.Run;
                    end;
                }
                action(GenerateEFT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Generate EFT';
                }
            }
        }
    }

    var
        EFTGenerate: Report "Generate EFT transactions";
}

