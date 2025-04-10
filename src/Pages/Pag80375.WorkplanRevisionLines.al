

page 80375 "Workplan Revision Lines"
{
    PageType = ListPart;
    SourceTable = "Workplan Lines Revision";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Revision Workplan"; Rec."Revision Workplan")
                {
                    ApplicationArea = Basic;
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = "Unit of Measure";
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Imported Annual Budget Est."; Rec."Imported Annual Budget Est.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Source Of Fund"; Rec."Source Of Fund")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = true;
                }
                field("New Description"; Rec."New Description")
                {
                    ApplicationArea = Basic;
                }
                field("New Target Qty"; Rec."New Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("New Budget Est."; Rec."New Budget Est.")
                {
                    ApplicationArea = Basic;
                }
                field("New Primary Directorate"; Rec."New Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("New Primary Department"; Rec."New Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("New Perfomance Indicator"; Rec."New Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("New Source Of Fund"; Rec."New Source Of Fund")
                {
                    ApplicationArea = Basic;
                }
                field("New Unit of Measure"; Rec."New Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("New Perfomance Direction"; Rec."New Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("New Framework Perspective"; Rec."New Framework Perspective")
                {
                    ApplicationArea = Basic;
                }
                field("New Strategy Framework"; Rec."New Strategy Framework")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

