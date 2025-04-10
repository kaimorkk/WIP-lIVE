

Page 52193676 "Loans"
{
    Editable = false;
    PageType = List;
    SourceTable = "Loan Product Type";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Loan Category"; Rec."Loan Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Category field.';
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Rate field.';
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Calculation Method field.';
                }
                field("No of Instalment"; Rec."No of Instalment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Instalment field.';
                }
                field("Loan No Series"; Rec."Loan No Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan No Series field.';
                }
                field(Rounding; Rec.Rounding)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding field.';
                }
                field("Rounding Precision"; Rec."Rounding Precision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rounding Precision field.';
                }

                field("Interest Deduction Code"; Rec."Interest Deduction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Deduction Code field.';
                }
                field("Deduction Code"; Rec."Deduction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Deduction Code field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000014; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000017; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("&Loan Applications")
            // {
            //     ApplicationArea = Basic;
            //     Caption = '&Loan Applications';
            //     Ellipsis = true;
            //     Image = "Table";
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Loan Applications";
            //     RunPageLink = "Loan Product Type" = field(Code), "Loan Category" = field("Loan Category");
            //     ToolTip = 'Executes the &Loan Applications action.';
            // }
        }
    }
}

#pragma implicitwith restore

