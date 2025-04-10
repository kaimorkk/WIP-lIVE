TableExtension 52193524 tableextension52193524 extends "No. Series Relationship" 
{
    Caption = 'No. Series Relationship';
    LookupPageID = "No. Series Lines";
    DrillDownPageID = "No. Series Lines";
    fields
    {
        modify("Code")
        {
            Caption = 'Code';
        }
        modify("Series Code")
        {
            Caption = 'Series Code';
        }
        modify(Description)
        {
            Caption = 'Description';
        }
        modify("Series Description")
        {
            Caption = 'Series Description';
        }
    }
}

