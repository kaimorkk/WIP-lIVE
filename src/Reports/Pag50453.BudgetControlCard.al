page 50453 "Budget Control Card"
{
    Caption = 'Budget Control Card';
    PageType = Card;
    SourceTable = "Budget Control Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.', Comment = '%';
                }
                field("Corporate Strategy"; Rec."Corporate Strategy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Corporate Strategy field.', Comment = '%';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Financial Year field.', Comment = '%';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.', Comment = '%';
                }
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter field.', Comment = '%';
                }
                field(Budget; Rec.Budget)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget field.', Comment = '%';
                }
            }
            Part("Lines"; "Budget Control Lines")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "Header No" = field(No);
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Initialize)
            {
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                Image = ActivateDiscounts;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Rec.InitializeLines();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec."Approval Status" <> Rec."Approval Status"::Open then
            CurrPage.Editable := false;
    end;

}
