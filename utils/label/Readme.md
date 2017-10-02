# label

This will create a pdf label with Code128 barcode and optionally send it to an ipp printer.

PDF is created for [Dymo 11354](https://www.dymo.eu/dymo-11354-removable-labels-32x57mm.html) labels.

Intended usage is to create labels for newly installed computers.

This utillity requires a working [GraphicsMagick](http://www.graphicsmagick.org/) installation.

## Usage

    node utils/label barcode-data extra-text [--print url-to-ipp-printer] [--file pdf-file]

A valid printer url could be: `ipp://pinocchio.local:631/printers/DYMO_LabelWriter_450`.
