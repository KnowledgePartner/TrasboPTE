pageextension 55000 "PTE Sales Setup" extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(Archiving)
        {
            group("Print Fee")
            {
                Visible = true;
                field("Print Fee Comment Code"; Rec."Print Fee Comment Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Sales Text Code to be used for Print Fee';
                }

                field("Print Fee G/L Account"; Rec."Print Fee G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'G/L Account used for invoicing Print Fee';
                }

                field("Print Fee Output Profile"; Rec."Print Fee Output Profile")
                {
                    ApplicationArea = All;
                    ToolTip = 'Output Profile that triggers invoicing of Print Fee';
                }

            }
        }
    }
}