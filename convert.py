# import json
# import os
# import sys

# with open(sys.argv[1], 'r') as f:
#     data = json.load(f)

# os.makedirs(os.path.dirname(sys.argv[2]), exist_ok=True)
# json.dump({'data': data}, open(sys.argv[2], 'w',encoding='utf-8'), indent=2, ensure_ascii=False)


import sys
import argparse


def build_parser():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-b",
        "--before-pred",
        help="before prediction preprocess",
        dest="beforepred",
        action="store_true",
        default=False,
    )
    parser.add_argument(
        "-a", "--after-pred", help="after prediction conversion", dest="afterpred", action="store_true", default=False
    )
    parser.add_argument("-i", "--input", help="input file")
    parser.add_argument("-o", "--output", help="output file")
    return parser


def preprocess(input, output):
    import json
    import os

    data = json.load(open(input, "r"))
    if os.path.dirname(output):
        os.makedirs(os.path.dirname(output), exist_ok=True)
    json.dump({"data": data}, open(output, "w", encoding="utf-8"), indent=2, ensure_ascii=False)


def postprocess(input, output):
    import pandas as pd
    import json

    data = json.load(open(input, "r"))
    df = pd.DataFrame({"id": [k for k, v in data.items()], "answer": [v for k, v in data.items()]})
    df.to_csv(output, index=False)


if __name__ == "__main__":

    parser = build_parser()
    args = parser.parse_args(sys.argv[1:])

    if args.beforepred:
        preprocess(args.input, args.output)
    elif args.afterpred:
        postprocess(args.input, args.output)
