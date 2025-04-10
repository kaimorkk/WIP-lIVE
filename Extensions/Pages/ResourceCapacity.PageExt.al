PageExtension 52193478 pageextension52193478 extends "Resource Capacity" 
{
    Caption = 'Resource Capacity';
    layout
    {
        modify("Matrix Options")
        {
            Caption = 'Matrix Options';
        }
        modify(PeriodType)
        {
            Caption = 'View by';
            OptionCaption = 'Day,Week,Month,Quarter,Year,Accounting Period';
        }
        modify(QtyType)
        {
            Caption = 'View as';
            OptionCaption = 'Net Change,Balance at Date';
        }
        
    }
    actions
    {
        modify("Previous Set")
        {
            Caption = 'Previous Set';
        }
        modify("Previous Column")
        {
            Caption = 'Previous Column';
        }
        modify("Next Column")
        {
            Caption = 'Next Column';
        }
        modify("Next Set")
        {
            Caption = 'Next Set';
        }
    }
}

