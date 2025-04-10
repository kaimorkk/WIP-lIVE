page 50173 "CRM Cues"
{
    ApplicationArea = All;
    Caption = 'CRM Cues';
    PageType = CardPart;
    SourceTable = "CRM Cues";
    RefreshOnActivate = true;
    layout
    {
        area(Content)
        {
            cuegroup("CRM Statistics")
            {
                Caption = 'CRM Statistics';

                field(Complaints; Rec.Complaints)
                {
                    ToolTip = 'Specifies the value of the Complaints field.', Comment = '%';
                    DrillDownPageId = "Complaints list";
                }
                field(Compliments; Rec.Compliments)
                {
                    ToolTip = 'Specifies the value of the Compliments field.', Comment = '%';
                    DrillDownPageId = "Complaints list";
                }
                field(Enquiry; Rec.Enquiry)
                {
                    ToolTip = 'Specifies the value of the Enquiry field.', Comment = '%';
                    DrillDownPageId = "Complaints list";
                }
            }
        }
    }
    trigger OnOpenPage();
    begin

        RESET;
        if not GET then begin
            INIT;
            INSERT;
        end;
    end;
}
