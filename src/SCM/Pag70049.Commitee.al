

page 70049 "Commitee"
{
    PageType = Card;
    SourceTable = "Procurement Committee";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
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
                field("Minimum Members"; Rec."Minimum Members")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Members field.';
                }
                field("Process Type"; Rec."Process Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Process Type field.';
                }
                field("RFQ Same Openinng_ Evaluation"; Rec."RFQ Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFQ Same Openinng_ Evaluation field.';
                }
                field("RFP Same Openinng_ Evaluation"; Rec."RFP Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFP Same Openinng_ Evaluation field.';
                }
                field("Tend Same Openinng_ Evaluation"; Rec."Tend Same Openinng_ Evaluation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tend Same Openinng_ Evaluation field.';
                }
                field("Evaluation Opening"; Rec."Evaluation Opening")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Opening field.';
                }
                field("Evaluation Process"; Rec."Evaluation Process")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Process field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

