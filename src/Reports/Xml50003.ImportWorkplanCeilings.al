xmlport 50005 "Import Workplan Ceilings"
{
    Caption = 'Import Ceilings';
    Format = VariableText;
    Direction = Import;
    UseRequestPage = false;

    schema
    {
        textelement(Root)
        {
            tableelement(AWP; "Annual Strategy Workplan")
            {
                fieldelement(No; AWP.No)
                {
                }
                textelement(SpendingUnitNameTxt)
                {
                }
                textelement(GeograpLocationTxt)
                {
                }
                textelement(SubHeadTxt)
                {
                }
                textelement(PlannedAmt)
                {

                }
                fieldelement(CeilingAmount; AWP."Ceiling Amount")
                {
                }

                trigger OnAfterInitRecord()
                begin
                    if CaptionRow then begin
                        CaptionRow := false;
                        currXMLport.Skip();
                    end;
                end;

                trigger OnBeforeModifyRecord()
                begin
                    Workplan.Reset();
                    Workplan.SetRange("Annual Workplan", BatchHeader);
                    Workplan.Setrange(No, AWP.No);
                    if Workplan.FindFirst() then begin
                        Workplan."Ceiling Amount" := AWP."Ceiling Amount";
                        Workplan.Modify();
                    end;
                    currXMLport.Skip();
                end;

                trigger OnBeforeInsertRecord()
                begin
                    Workplan.Reset();
                    Workplan.SetRange("Annual Workplan", BatchHeader);
                    Workplan.Setrange(No, AWP.No);
                    if Workplan.FindFirst() then begin
                        Workplan."Ceiling Amount" := AWP."Ceiling Amount";
                        Workplan.Modify();
                    end;
                    currXMLport.Skip();
                end;
            }
        }
    }

    var
        Workplan: Record "Annual Strategy Workplan";
        BatchHeader: Code[20];
        CaptionRow: Boolean;

    trigger OnInitXmlPort()
    begin
        CaptionRow := true;
    end;

    procedure GetBatchHeader(BHeader: Code[20])
    begin
        BatchHeader := BHeader;
    end;

}